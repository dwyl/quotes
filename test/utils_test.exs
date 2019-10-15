defmodule UtilsTest do
  use ExUnit.Case

  test "clean up data in quotes.json" do
    Utils.clean()
    
    # Confirm there are no anonymous authors:
    list = File.read!("quotes.json")
    |> Jason.decode!
    |> Enum.uniq
    |> Enum.map(fn q -> # quote must not be from unknown authors
      if q["author"] == ""
      || q["author"] == nil
      || q["author"] == "unknown"
      || q["author"] == "anonymous" do
        q
      end
    end)
    |> Enum.filter(& !is_nil(&1))

    assert Enum.count(list) == 0
  end
end
