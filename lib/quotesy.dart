/// Support for doing something awesome.
///
/// More dartdocs go here.
library quotesy;

import 'dart:convert';
import 'dart:io';
import 'dart:math';

class QuoteInfo {
  final String author;
  final String text;

  QuoteInfo(this.text, this.author);

  factory QuoteInfo.fromJson(Map<String, dynamic> json) {
    return QuoteInfo(
      json['text'],
      json['author'],
    );
  }
}

class Quotes {
  static Future<List<QuoteInfo>> _quotesList() async {
    String jsonString = await File('quotes.json').readAsString();
    List<dynamic> jsonList = json.decode(jsonString);
    List<QuoteInfo> quotes = jsonList.map((json) => QuoteInfo.fromJson(json)).toList();
    return quotes;
  }

  static list() async {
    return await _quotesList();
  }

  static Future<QuoteInfo> random() async {
    final random = Random();
    final list = await _quotesList();

    return list[random.nextInt(list.length)];
  }

  static Future<List<QuoteInfo>> byAuthor(String author) async {
    final list = await _quotesList();
    return list.where((quote) => quote.author == author).toList();
  }

  static Future<QuoteInfo> singleRandomByAuthor(String author) async {
    final list = await _quotesList();
    final listByAuthor = list.where((quote) => quote.author == author).toList();
    final random = Random();

    return listByAuthor[random.nextInt(listByAuthor.length)];
  }
}
