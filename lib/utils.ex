defmodule Utils do
  def remove_noise do
    {:ok, data} = File.read("quotes_raw.json")
    list = Jason.decode!(data)
    IO.inspect Enum.count(list)
    clean = list
    |> Enum.uniq
    |> Enum.map(fn q ->
      if q["author"] != "" && q["author"] != nil do
        q
      end
    end)
    |> Enum.filter(& !is_nil(&1))
    |> Enum.sort_by(fn q ->
      q["author"]
    end)

    IO.inspect Enum.count(clean)
    File.write!("quotes.json", Jason.encode!(clean))
  end

  def count do
    File.read!("quotes.json")
    |> Jason.decode!()
    |> Enum.count
    |> IO.inspect(label: "count")
  end
end
