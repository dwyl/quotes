const quotes = require("../quotes.json")

/**
 * `parse_json` returns and Array of quote Objects.
 */
function parse_json () {
  return quotes;
}

/**
 * `random` returns a random quote
 * returns Object - a random quote from the list
 */
function random () {
  return quotes[Math.floor(Math.random() * quotes.length)];
}



module.exports = {
  parse_json: parse_json,
  random: random
};
