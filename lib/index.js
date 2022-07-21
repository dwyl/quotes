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

/**
 * `random_by_author` returns a random quote for a specific author
 * returns Object - a random quote from the list with the desired author name
 */
function random_by_author (name) {
  const q_by_author = quotes.filter((q) => {
    return q.text.includes(name) || (q.author && q.author.includes(name))
  })
  return q_by_author[Math.floor(Math.random() * q_by_author.length)];
}

/**
 * `random_by_source` returns a random quote for a specific source
 * returns Object - a random quote from the list with the desired source url
 */
function random_by_source (url) {
  const q_by_source = quotes.filter((q) => {
    return q.text.includes(url) || (q.source && q.source.includes(url))
  })
  return q_by_source[Math.floor(Math.random() * q_by_source.length)];
}

/**
 * `search_by_author` returns a list of quotes for a specific author name
 * returns Array of quote Objects - an array list of quote objects from the list with the desired author name
 */
 function search_by_author (name) {
  const q_by_author = quotes.filter((q) => {
    return q.text.includes(name) || (q.author && q.author.includes(name))
  })
  return q_by_author;
}

/**
 * `search_by_tag` returns a list of quotes for a specific tag
 * returns Array of quote Objects - an array list of quote objects from the list with the desired tag
 */
 function search_by_tag (tag) {
  const q_by_tag = quotes.filter((q) => {
    return q.text.includes(tag) || (q.tags && q.tags.includes(tag))
  })
  return q_by_tag;
}

/**
 * `search_by_source` returns a list of quote for a specific source
 * returns Array of quote Objects - an array list of quote objects from the list with the desired source url
 */
 function search_by_source (url) {
  const q_by_source = quotes.filter((q) => {
    return q.text.includes(url) || (q.source && q.source.includes(url))
  })
  return q_by_source;
}


module.exports = {
  parse_json: parse_json,
  random: random,
  random_by_tag: random_by_tag,
  random_by_author: random_by_author,
  random_by_source: random_by_source,
  search_by_author: search_by_author,
  search_by_tag: search_by_tag,
  search_by_source: search_by_source
};
