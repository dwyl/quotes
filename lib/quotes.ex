defmodule Quotes do
  @moduledoc """
  Documentation for Quotes.
  """

  @doc """
  `parse_json` returns a list of maps containing quotes. <br />

  The format returned is:
  ```elixir
  [
    %{
      "author" => "Albert Einstein",
      "text" => "Once we accept our limits, we go beyond them."
    },
    %{
      "author" => "Peter Drucker",
      "source" => "https://www.goodreads.com/quotes/784267",
      "tags" => "time, management",
      "text" => "Until we can manage time, we can manage nothing else."
    }
    %{...},
    ...
  ]
  ```
  All quotes MUST have an `author` and `text` field. <br />
  Some quotes have `tags` and `source`,
  please help to expand/verify others. <br />
  see: https://github.com/nelsonic/quotes#contributing
  """
  def parse_json do
    {:ok, cwd} = File.cwd
    IO.inspect(cwd, label: "cwd 33")
    # we need this cd to locate the file in /deps
    case cwd =~ "/quotes" do
      # coveralls-ignore-start
      true ->
        File.read!("/quotes.json") |> Jason.decode!()
      false -> # temporarily cd into deps/quotes dir and read quotes.json file:
        File.cd!("deps/quotes")
        {:ok, cwd} = File.cwd
        IO.inspect(cwd, label: "cwd 42")

        data = File.read!("quotes.json"))
        |> Jason.decode!()
        File.cd!("../..")
        data
      # coveralls-ignore-stop
    end
  end

  @doc """
  `random` returns a random quote. <br />

  e.g:
  ```elixir
  %{
    "author" => "Peter Drucker",
    "source" => "https://www.goodreads.com/quotes/784267",
    "tags" => "time, management",
    "text" => "Until we can manage time, we can manage nothing else."
  }
  ```
  """
  def random do
    parse_json()
    |> Enum.random()
  end

  @doc """
  `random_by_tag` returns a random quote for the chosen tag/keyword.

  e.g:
  ```elixir
  iex> Quotes.random_by_tag("time")
  %{
    "author" => "Leo Tolstoy",
    "text" => "The two most powerful warriors are patience and time."
  }
  ```
  """
  def random_by_tag(tag) do
    # IO.inspect(tag)
    parse_json()
    |> Enum.map(fn q ->
      # IO.inspect(q)
      if ( !is_nil(q["text"]) && q["text"] =~ tag )
      || ( !is_nil(q["tags"]) && q["tags"] =~ tag )
      do
        q
      end
    end)
    |> Enum.filter(& !is_nil(&1))
    |> Enum.random()
  end



end
