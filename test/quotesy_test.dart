import 'package:quotesy/quotesy.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    test('Fetching quotes list', () async {
      final quotesArray = await Quotes.list();
      expect(quotesArray.length, greaterThan(0));
      expect(quotesArray.first.author, "Abraham Lincoln");
    });

    test('Fetching random element', () async {
      final randomQuote = await Quotes.random();
      expect(randomQuote, isNotNull);
    });

    test('Fetching by author', () async {
      final quoteList = await Quotes.byAuthor("Abraham Lincoln");
      expect(quoteList.length, greaterThan(0));
    });

    test('Fetching random quote by author', () async {
      final quoteList = await Quotes.singleRandomByAuthor("Abraham Lincoln");
      expect(quoteList.author, "Abraham Lincoln");
    });
  });
}
