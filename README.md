# 💬 `quotes`

### Disclaimer for contributions

If you are thinking of _contributing_ to this repository (hooray! :tada:),
please make sure you
[read the `Contributing` section](https://github.com/dwyl/quotes#contributing)
of this repo.  

There are many websites that already contain quotes and this repository is
intended as a _sub-section_ of uniquely _inspiring_ quotes.
See [`Avoid Quotes That Don't Inspire Action`](https://github.com/dwyl/quotes#avoid-quotes-that-dont-inspire-action).

As such, ***we remind you that we will only be able to accept PRs that conform
to the following key criteria***:
1. An issue has been opened to _propose_ the quote, including why _you_ find it
particularly inspiring :fire:
2. That issue has received _at least_ 2 'thumbs up' (:+1:) from people in the
dwyl community.
3. Your PR refers to the issue itself and has a clear title and description.

> Thank you again for your contributions to this and [other dwyl repos](https://github.com/dwyl/?q=learn_),
we very much appreciate it! :heart:

### 1. A collection of inspiring quotations.

The quotes are contained
in a _single_ file:
[**`quotes.json`**](https://github.com/nelsonic/quotes/blob/master/quotes.json) <br />
so they can _easily_ be used independently
of _any_ programming language.

<!--
Below are usage examples in
several languages.
-->


### 2. A module that returns a quote when invoked.


[![Hex pm](http://img.shields.io/hexpm/v/quotes.svg?style=flat-square)](https://hex.pm/packages/quotes)
[![npm package version](https://img.shields.io/npm/v/quotesy.svg?style=flat-square)](https://www.npmjs.com/package/quotesy)
[![Build Status](https://img.shields.io/travis/dwyl/quotes/master.svg?style=flat-square)](https://travis-ci.org/dwyl/quotes)
[![codecov.io](https://img.shields.io/codecov/c/github/dwyl/quotes/master.svg?style=flat-square)](http://codecov.io/github/dwyl/quotes?branch=master)
[![contributions welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat-square)](https://github.com/dwyl/quotes#contributing)
[![HitCount](http://hits.dwyl.io/dwyl/quotes.svg)](http://hits.dwyl.io/dwyl/quotes)


![gandhi-future-depens-on-what-you-do-today](https://user-images.githubusercontent.com/194400/66840284-b9399100-ef5f-11e9-80e4-6d62f872f908.jpg "The future depends on what you do today ~ Mahatma Gandhi")


## Why?

We needed a reliable and _fast_ source of quotes.
There are _many_ ways of getting quotes
including several APIs
but we wanted something
that had _zero_ latency
and could (_optionally_) work _offline_
so we collated a database from various sources.


## What?

1. A file containing thousands of inspiring quotes.
2. A module for returning a random quote.

The
[**`quotes.json`**](https://github.com/nelsonic/quotes/blob/master/quotes.json)
file
can be used in _any_ project or programming language.

The module can be used from `Elixir` and `Javascript`/`Node.js`.

## _How_?

There are two ways you can use this project: <br>
**A.** Use the
[**`quotes.json`**](https://github.com/nelsonic/quotes/blob/master/quotes.json)
list of quotes _directly_ (_for any purpose_). <br />
**B.** Use the module to return a random quote; sample code below.


## `Elixir`

Our original reason
for creating the `quotes` project
was to show a practical
code reuse example in `Elixir`. <br />
If you are learning `Elixir`
(_and we think you
  [should](https://github.com/dwyl/learn-elixir/issues/102)
  be_),
follow along with the <!-- update link once published! -->
[code reuse tutorial](https://github.com/dwyl/learn-elixir/blob/code-reuse-publishing-to-hexpm-issue%2395/code-reuse-hexpm.md)
to see this module in action!

### Install from Hex.pm

The `quotes` Elixir module is available on hex.pm:
[hex.pm/packages/**quotes**](https://hex.pm/packages/quotes) <br />
Add `quotes` to your list of `deps` (dependencies) in `mix.exs`:

```elixir
def deps do
  [
    {:quotes, "~> 1.0.5"}
  ]
end
```

In your terminal run the command:

```sh
mix deps.get
```

That will download the module
into your project's `deps` directory.

### Usage in `Elixir`

To get a random quote from the list invoke:

```elixir
iex> Quotes.random()
```
You will receive a `Map`
with an `"author"` and `"text"` fields. e.g:

```elixir
%{
  "author" => "Peter Drucker",
  "text" => "The best way to predict your future is to create it."
}
```

_Some_ of the quotes have been augmented with a `"source"` and `"tags"`:

```elixir
%{
  "author" => "Peter Drucker",
  "source" => "https://www.goodreads.com/quotes/784267",
  "tags" => "time, management",
  "text" => "Until we can manage time, we can manage nothing else."
}
```
`random_by_tag` - get a _random_ quote by a _specific_ tag e.g: `Quotes.random_by_tag("time")`


```elixir
iex> Quotes.random_by_tag("time")
%{
  "author" => "Leo Tolstoy",
  "text" => "The two most powerful warriors are patience and time."
}

iex> Quotes.random_by_tag("curious")
%{
  "author" => "Albert Einstein",
  "source" => "https://www.goodreads.com/quotes/11458",
  "tags" => "talent, curious, curiosity, passion",
  "text" => "I have no special talent. I am only passionately curious."
}
```

<br />

## `JavaScript` / `Node.js`

### Install from NPM

```sh
npm install quotesy --save
```

### Node.js Sample Code:

```js
// Get Random Quote:
const quotes = require("quotesy");
quotes.random(); // expect an object of the following form:
{
  "author": "Peter Drucker",
  "text": "The best way to predict your future is to create it."
}

// get a random quote featuring a desired tag e.g: "time"
quotes.random_by_tag("time");
{
  "author": "Leo Tolstoy",
  "text": "The two most powerful warriors are patience and time."
}
```

You can always filter the `json` based on your own custom function:

```js
// Array of quotes with 12 words
const json = require("quotesy").parse_json();
const buddha_quotes = json.filter(function (item) {
  return item.text.split(" ").length <= 12;
});

// Array of quotes for author Buddha
const json = require("quotesy").parse_json;
const buddha_quotes = json.filter(function (item) {
	return item.author === "Buddha";
});

```


### React.js Sample Code:

```jsx
// Get Random Quote:
import quotes from 'quotesy'

class RandomQuote extends Component {
   state = {
      quote: quotes.random()
   }

   render(){
   const { author, text } = this.state.quote
     return(
       <blockquote>
       	{text}
       <cite>-{author}/cite>
       </blockquote>

     )
   }
}

```

<br />
<hr />

## Need a _Different_ Programming Language ...?

Want to add an example in your preferred programming language? <br />
Please comment on this issue:
[quotes/issues/6](https://github.com/dwyl/quotes/issues/6)

<hr />
<br />

## Contributing

As with all [@dwyl](https://github.com/dwyl) projects,
contributions are _very much_ welcome! <br />
There are 3 ways of contributing to the quotes project:

1. Curate
2. Add
3. Share

### 1. Curate the _Existing_ Quotes

Read through the _existing_ quotes
and check they are accurate,
insightful and inspires _positive action_.
Accuracy means no misquotes or _misattributions_
(_attributing a quote to an author when in fact they never said/wrote it_).
Insightful means it gives us some insight that we can apply to our own lives.
Inspires _positive action_ is vital,
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
and does not inspire any _action_.
<!--
it implies that intelligence
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
there simply isn't any _empirical **evidence**_.
`#rant`
-->



### _Improve_ Existing Quotes with Sources & Tags

Open the `quotes.json` file and scroll through the quotes. <br />
If you find a quote that you like
(_that doesn't already have "source" or "tags")
you can _enhance_ it with a source and tags.

For example, consider the following quote
(_before the addition of a source or tags_):

```js
{
  "author": "Albert Einstein",
  "text": "I have no special talent. I am only passionately curious."
},
```

To find a reputable source, simply copy paste the quote
into your favourite search engine:

https://duckduckgo.com/?q=I+have+no+special+talent.+I+am+only+passionately+curious

![duck-duck-go-search-for-einstein-quote](https://user-images.githubusercontent.com/194400/66868307-01bf7180-ef95-11e9-93f3-4cba28512b87.png)

Click the link to visit the source and confirm that it's good.

https://www.goodreads.com/quotes/11458-i-have-no-special-talents-i-am-only-passionately-curious

![goodreads-einstein-quote](https://user-images.githubusercontent.com/194400/66868413-2ca9c580-ef95-11e9-94f7-79f62e7424b2.png)

We only need the part of the URL up to the end of the digits:
https://www.goodreads.com/quotes/11458 <br />
(_the rest is added to the URL for SEO purposes
  and is not required to find the resource_)

Add the source and any relevant tags:
```js
{
  "author": "Albert Einstein",
  "text": "I have no special talent. I am only passionately curious.",
  "source": "https://www.goodreads.com/quotes/11458",
  "tags": "talent, curious, curiosity, passion"
},
```
Open the
[`quotes.json`](https://github.com/dwyl/quotes/blob/master/quotes.json)
file in your web browser (_while logged-in to GitHub_):

![github-click-pencil-icon-to-edit](https://user-images.githubusercontent.com/194400/66868718-c40f1880-ef95-11e9-9d84-979a847af875.png)

Click the **pencil icon** to edit the file.
Once in edit mode, locate the quote by searching for it:

![locate-the-quote](https://user-images.githubusercontent.com/194400/66869250-df2e5800-ef96-11e9-8235-0cd7a79d22f9.png)

Make the edit to add the `"source"` and `"tags"`:
![update-the-quote](https://user-images.githubusercontent.com/194400/66869516-83180380-ef97-11e9-82c6-59600b58b9bb.png)

Scroll down to the bottom of the page till you see **Commit changes** <br />
(_or use your browser shortcut to go to the bottom e.g: the **[`End`]** key_)

![add-commit-message-and-branch-name](https://user-images.githubusercontent.com/194400/66869523-8612f400-ef97-11e9-9aa4-e43815a90a1e.png)

Write a descriptive commit message and
give your branch and appropriate/obvious name: <br />
e.g: `add-source-and-tags-to-einstein-quote`

Click the button that says "**Propose file change**".

Your browser will navigate to the "**Open a pull request**" page:

![create-pull-request](https://user-images.githubusercontent.com/194400/66869856-29fc9f80-ef98-11e9-8b7e-b543de6ba68c.png)

Add a relevant description
and click the "**Create pull request**" button. <br />

Example: https://github.com/dwyl/quotes/pull/7

![pull-request-awaiting-review](https://user-images.githubusercontent.com/194400/66870553-9e840e00-ef99-11e9-88f2-3a84ec4b2199.png)

Provided your changes/improvements pass the automated checks
and are sensible, <br />
they will be **approved**
and ***merged*** by an existing member of the project:

![pull-request-merged](https://user-images.githubusercontent.com/194400/66870725-fde21e00-ef99-11e9-8de1-720ab0ffdeef.png)

Once you've contributed an improvement,
you'll be invited to be a maintainer
and will be able to approve other people's additions.


<!-- Let's add this in once we have received a few quote submissions
### 1.b _Review_ Pull Requests for New Additions

Once you have successfully added a quote to the project,
you will be added as a maintainer.
At that point you will be able to review
other people's additions.
-->


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
https://www.forbes.com/sites/onmarketing/2011/12/14/the-real-story-behind-apples-think-different-campaign <br />
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
},
```

## 3. Share!

+ Let others know about this bank of quotes
by "starring" the project on GitHub! ⭐️
+ If you have an interesting use case for quotes,
please share!



<br />

<!--

#### `Utils.clean()` Removes Quotes Where `author` is `null`, `unknown` or `anonymous`

We aren't interested in having quotes from anonymous authors. <br />
Anonymous quotes might as well have been said
by your mate Steve said at the pub;
they have their place, but it's not here.

So we need to _remove_ them from any bulk quote files.
see: `Utils.clean` in
[/lib/utils.ex#L17](https://github.com/dwyl/quotes/blob/cff02564691b512e66a2d39701fcd0d6b19d98f3/lib/utils.ex#L17)

-->
