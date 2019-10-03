defmodule QuotesTest do
  use ExUnit.Case
  doctest Quotes

  test "greets the world" do
    assert Quotes.hello() == :world
  end
end
