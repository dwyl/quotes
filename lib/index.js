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

/**
 * `random_by_tag` returns a random quote for a specific tag
 * returns Object - a random quote from the list with the desired tag
 */
function random_by_tag (tag) {
  const q_by_tag = quotes.filter((q) => {
    return q.text.includes(tag) || (q.tags && q.tags.includes(tag))
  })
  return q_by_tag[Math.floor(Math.random() * q_by_tag.length)];
}




module.exports = {
  parse_json: parse_json,
  random: random,
  random_by_tag: random_by_tag
};
