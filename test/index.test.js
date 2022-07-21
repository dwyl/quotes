const quotes = require('../lib');
const test = require('tape'); // see: github.com/dwyl/learn-tape

test('quotes.parse_json returns a list of quote objects', function (t) {
  t.ok(Object.keys(quotes.parse_json()).length > 1500);
  t.end();
});

// believe it or not, there's no native way to check if an object is in an array
function array_contains_object (arr, obj) {
  let i;
  for (i = 0; i < arr.length; i++) {
    if (arr[i] === obj) {
      return true;
    }
  }

  return false;
}

// recursively call quotes.random until a collision is found:
function get_random_quote_until_collision (random_quotes_list) {
  random_quote = quotes.random();
  if(array_contains_object(random_quotes_list, random_quote)) {
    return random_quotes_list;
  }
  else {
    random_quotes_list.push(random_quote);
    return get_random_quote_until_collision(random_quotes_list);
  }
}

// this test relies on The Birthday Pardox to test "predictable randomness"
test('quotes.random returns a random quote object', function (t) {
  const random_quotes_list = get_random_quote_until_collision([]);
  t.ok(Object.keys(random_quotes_list).length < 200);
  t.end();
});

test('quotes.random_by_tag returns a random quote object by tag', function (t) {
  const tag = "time";
  const q = quotes.random_by_tag(tag);
  // check that the quote returned contains the tag in either text or tags:
  const truthy = q.text.includes(tag) || q.tags && q.tags.includes(tag);
  t.ok(truthy);
  t.end();
});

test('quotes.random_by_author returns a random quote object by author', function (t) {
  const name = "Mahatma Gandhi";
  const q = quotes.random_by_author(name);
  // check that the quote returned contains the author name in either text or author:
  const truthy = q.text.includes(name) || q.author && q.author.includes(name);
  t.ok(truthy);
  t.end();
});

test('quotes.random_by_source returns a random quote object by source', function (t) {
  const url = "https://www.goodreads.com";
  const q = quotes.random_by_source(url);
  // check that the quote returned contains the source url in either text or source:
  const truthy = q.text.includes(url) || q.source && q.source.includes(url);
  t.ok(truthy);
  t.end();
});

test('quotes.search_by_author returns a list of searched quote objects by author name', function (t) {
  const name = "Alexis Carrel";
  t.ok(Object.keys(quotes.search_by_author(name)).length > 0);
  t.end();
});

test('quotes.search_by_tag returns a list of searched quote objects by tag', function (t) {
  const tag = "time";
  t.ok(Object.keys(quotes.search_by_tag(tag)).length > 0);
  t.end();
});

test('quotes.search_by_source returns a list of searched quote objects by source', function (t) {
  const url = "https://www.goodreads.com";
  t.ok(Object.keys(quotes.search_by_source(url)).length > 0);
  t.end();
});
