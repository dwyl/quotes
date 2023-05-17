/// Support for doing something awesome.
///
/// More dartdocs go here.
library quotesy;

import 'dart:convert';
import 'dart:io';

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
  static Future<List<QuoteInfo>> loadQuotes() async {
    String jsonString = await File('quotes.json').readAsString();
    List<dynamic> jsonList = json.decode(jsonString);
    List<QuoteInfo> quotes = jsonList.map((json) => QuoteInfo.fromJson(json)).toList();
    return quotes;
  }
}
