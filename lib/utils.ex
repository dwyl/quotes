defmodule Utils do
  def clean do
    count() # count before running
    list = File.read!("quotes.json")
    |> Jason.decode!
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
    |> Jason.encode!(pretty: true)

    File.write!("quotes.json", list)
  end

  def count do
    File.read!("quotes.json")
    |> Jason.decode!()
    |> Enum.count
    |> IO.inspect(label: "count")
  end
end
