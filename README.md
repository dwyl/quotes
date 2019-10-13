# 💬 `quotes`

1. A collection of inspiring quotations.

The quotes are contained
in a _single_ file:
[**`quotes.json`**](https://github.com/nelsonic/quotes/blob/master/quotes.json)
so they can be used independently
of any programming language.

<!--
Below are usage examples in
several languages.
-->


2. A module that returns a quote when invoked.
Methods include `random`, `author` and `tag`.


## Why?

We needed a reliable and _fast_ source of quotes.
There are _many_ ways of getting quotes
including several APIs
but we wanted something
that had _zero_ latency
and could (_optionally_) work _offline_
so we _had_ to collate a database.

The
[**`quotes.json`**](https://github.com/nelsonic/quotes/blob/master/quotes.json)
file
can be used in _any_ project or programming language.




## What?



## _How_?




# Functions





## `Elixir`

Our original reason
for creating the `quotes` project
was to show a practical
code reuse example in `Elixir`.
If you are learning `Elixir`
(_and we think you should be_),
follow along with the ]
[code reuse tutorial]()
to see this module in action!

### Installation

If [available in Hex](https://hex.pm/docs/publish),
the package can be installed
by adding `quotes` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:quotes, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/quotes](https://hexdocs.pm/quotes).

<!--

## `Node.js`

# Node.js Sample Code:

```js

// Array of quotes with 12 words
const file = "quotes.json";
$.getJSON(file).done(function (json) {
	return json.filter(function (item) {
		return item.text.split(" ").length <= 12;
	});
});

// Array of quotes for author Buddha
const file = "quotes.json";
$.getJSON(filePath).done(function (json) {
	return json.filter(function (item) {
		return item.author === "Buddha";
	});
});
```

## `Python`



## Your Favourite Programming Language ...?

#HelpWanted >
-->




### Remove Quotes Where `author` is `null`, `unknown` or `anonymous`

We aren't interested in having quotes from anonymous authors.
Anonymous quotes might as well have been said
by your mate Steve said at the pub;
they have their place, but it's not here.

So we need to _remove_ them from any bulk quote files.
see: `Utils.clean` in
[/lib/utils.ex#L7](https://github.com/nelsonic/quotes/blob/1c0726a8d7cfd14d07f6e58c15ee52beb705fd1b/lib/utils.ex#L7)


## Contributing

As always with [@dwyl]() projects,
contributions are _very much_ welcome! <br />
There are 3 ways of contributing to this project:

1. Curate
2. Add
3. Share

### 1. Curate the _Existing_ Quotes

Read through the _existing_ quotes
and check they are accurate,
insightful and _positive_.
Accuracy means no misquotes or _misattributions_
(_attributing a quote to an author when in fact they never said/wrote it_).
Insightful means it gives us some insight that we can apply to our own lives.
Positivity is vital,
we aren't interested in quotes with a negative tone.

For example, consider the following quote which is _not_ included in our list:

> "_Happiness in intelligent people is the rarest thing I know_.”
~ [Ernest Hemingway](https://en.wikipedia.org/wiki/Ernest_Hemingway)

This quote is certainly _interesting_
and it may even be **`true`** in certain cases;
some of the most intelligent people
in history have been utterly miserable for whatever reason.
While the quote is insightful
it's _definitely_ not _positive_
because it implies that intelligence
and happiness are
[mutually exclusive](https://en.wikipedia.org/wiki/Mutual_exclusivity),
which we _all_ know is misleading.
In fact there is evidence that intelligence
if _used_ for positive ends
leads to
[greater well-being](https://blogs.scientificamerican.com/beautiful-minds/can-intelligence-buy-you-happiness).
Happiness has far more to do with mindset, mindfulness and relationships
than traditionally quantifiable intelligence metrics.
But it's ridiculous to suggest that
most intelligent people are unhappy,
there simply isn't any _empirical **evidence**_. `#rant`




### 1.a _Improve_ Existing Quotes with Sources & Tags





### 1.b _Review_ Pull Requests for New Additions





## 2. Add Quotes!

If there is a quote
you find inspiring/motivating
that is _not_ already in the
[**`quotes.json`**](https://github.com/nelsonic/quotes/blob/master/quotes.json)
file, please add it!


## Guidelines for Good Quotes

### Keep the length of quotes below 200 characters.

Avoid adding quotes that are essays; the shorter the quote the better. <br />
For example:

> "_Here's to the crazy ones. The misfits. The rebels.
The troublemakers. The round pegs in the square holes.
The ones who see things differently.
They're not fond of rules.
And they have no respect for the status quo.
You can quote them, disagree with them, glorify or vilify them.
About the only thing you can't do is ignore them.
Because they change things.
They push the human race forward.
And while some may see them as the crazy ones, we see genius.
Because the people who are crazy enough to think they can change the world,
are the ones who do._"
~ Rob Siltanen

That quote is 101 words (547 characters); it's an essay.
It was the **script** written by Siltanen
for the Apple "Think Different" commercial.
We prefer the short version (18 words | 85 characters):

> "_The people who are crazy enough
to think they can change the world
are the ones who do._"
~ [Rob Siltanen](https://www.goodreads.com/author/quotes/14907567.Rob_Siltanen)

There is definitely a place for longer quotes
e.g: the ["Think Different"](https://en.wikipedia.org/wiki/Think_different)
Apple ad campaign.

[![apple-think-different-advert](https://user-images.githubusercontent.com/194400/66713966-784b4c00-eda8-11e9-9dac-caa134b35eed.png)](https://www.google.com/search?q=apple+think+different+campaign&tbm=vid)

Our purpose with _this_ bank of quotes is to have _brief_ quotes
that take less than 10 seconds to read and are inspiring/motivating
not distracting.

In this case the addition would be:

```json
{
  "text": "The people who are crazy enough to think they can change the world are the ones who do.",
  "author": "Rob Siltanen",
  "source": "https://www.goodreads.com/quotes/597615",
  "tags": "change, world, apple, think, different"  
}
```

Note: This is also a good example of a quote that has been _misattributed_.
Given that Steve Jobs _read_ the script in the Apple "Think Different"
commercial, people often _misattribute_ the quote to Steve.
A minute of research and we are better informed:
https://www.forbes.com/sites/onmarketing/2011/12/14/the-real-story-behind-apples-think-different-campaign
Jobs initially called the script “sh*t” ...
Read the article, it's a _fascinating_ insight into the creative process!

### Avoid Quotes That Don't Inspire _Action_

![Karl-Pilkington-quote-glass-houses](https://user-images.githubusercontent.com/194400/66721019-511d6a80-edfa-11e9-8a0a-907aea0f0c3e.png)

[Karl Pilkington](https://en.wikipedia.org/wiki/Karl_Pilkington)
is often _hilarious_ and even insightful,
but this quote while amusing,
does not _inspire_ any _action_ in the reader.


### Film Quotes

Movies can _often_ be thought provoking, insightful and positive. e.g:

![do-or-do-not-yoda](https://user-images.githubusercontent.com/194400/66716967-bd34aa00-edcb-11e9-9f04-db549a770707.gif "Do or do not, there is no try! ~ Yoda")



Where a quote from a movie is relevant, add it like this:

```json
{
  "text": "Do. Or do not. There is no try",
  "author": "Yoda",
  "source": "https://www.starwars.com/news/the-starwars-com-10-best-yoda-quotes",
  "tags": "fictional, movie, do, try, star wars"  
}
```

## 3. Share Your Use Case!

If you have an interesting use case for quotes,
please share below!
