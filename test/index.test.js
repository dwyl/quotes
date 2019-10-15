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
