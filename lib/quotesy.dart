library quotesy;

import 'dart:convert';
import 'dart:io';
import 'dart:math';

/// Class holding a quote information
class QuoteInfo {
  final String author;
  final String text;
  final String? source;
  final String? tags;

  QuoteInfo(this.text, this.author, {this.source, this.tags});

  factory QuoteInfo.fromJson(Map<String, dynamic> json) {
    return QuoteInfo(
      json['text'],
      json['author'],
      source: json['source'],
      tags: json['tags'],
    );
  }
}

/// Static class that can be invoked to fetch quotes
class Quotes {

  /// Loads the information from the `.json` file containing the quotes list.
  static Future<List<QuoteInfo>> _quotesList() async {
    String jsonString = await File('quotes.json').readAsString();
    List<dynamic> jsonList = json.decode(jsonString);
    List<QuoteInfo> quotes = jsonList.map((json) => QuoteInfo.fromJson(json)).toList();
    return quotes;
  }

  /// Returns a list of quotes
  static list() async {
    return await _quotesList();
  }

  /// Returns a random quote
  static Future<QuoteInfo> random() async {
    final random = Random();
    final list = await _quotesList();

    return list[random.nextInt(list.length)];
  }

  /// Returns a list of quotes by author
  static Future<List<QuoteInfo>> byAuthor(String author) async {
    final list = await _quotesList();
    return list.where((quote) => quote.author == author).toList();
  }

  /// Returns a random quote by author
  static Future<QuoteInfo> singleRandomByAuthor(String author) async {
    final list = await _quotesList();
    final listByAuthor = list.where((quote) => quote.author == author).toList();
    final random = Random();

    return listByAuthor[random.nextInt(listByAuthor.length)];
  }
}
