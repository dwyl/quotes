defmodule QuotesTest do
  use ExUnit.Case

  test "parse_json returns a list of maps containing quotes" do
    list = Quotes.parse_json()
    assert Enum.count(list) == Utils.count()

    # sample quote we know is in the list
    sample =  %{
      "author" => "Albert Einstein",
      "text" => "A person who never made a mistake never tried anything new."
    }

    # find the sample quote in the List of Maps:
    [found] = Enum.map(list, fn q ->
      if q["author"] == sample["author"] && q["text"] == sample["text"] do
        q
      end
    end)
    |> Enum.filter(& !is_nil(&1)) # filter out any nil values
    assert sample == found # sample quote was found in the list
  end

  test "all quotes have author and text property" do
    Quotes.parse_json()
    |> Enum.each(fn(q) ->
      assert Map.has_key?(q, "author")
      assert Map.has_key?(q, "text")
      assert String.length(q["author"]) > 2 # see: https://git.io/Je8CO
      assert String.length(q["text"]) > 10
    end)
  end

  # This recursive function calls Quotes.random until a quote is repeated
  def get_random_quote_until_collision(random_quotes_list) do
    random_quote = Quotes.random()
    if Enum.member?(random_quotes_list, random_quote) do
      random_quotes_list
    else
      get_random_quote_until_collision([random_quote | random_quotes_list])
    end
  end

  test "Quotes.random returns a random quote" do
    # execute Quotes.random and accoumlate until a collision occurs
    random_quotes_list = get_random_quote_until_collision([])
    # this is the birthday paradox at work! ;-)
    # IO.inspect Enum.count(random_quotes_list)
    assert Enum.count(random_quotes_list) < 200
  end

end
