defmodule Utils do
  @moduledoc """
  Useful utitlities for testing and processing Quotes.
  """

  @doc """
  cleans up quotes sourced from various places.
  see: https://github.com/nelsonic/quotes/issues/1
  """
  def clean do
    count() # count before running
    list = File.read!("quotes.json")
    |> Jason.decode!
    |> Enum.uniq
    |> Enum.map(fn q -> # quote must not be from unknown authors
      if q["author"] != "" && q["author"] != nil && q["author"] != "unknown" do
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


  @doc """
  count does exactly what you expect,
  returns the count of quotes in quotes.json
  """
  def count do
    File.read!("quotes.json")
    |> Jason.decode!()
    |> Enum.count
  end
end
