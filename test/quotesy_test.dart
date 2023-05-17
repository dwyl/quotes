import 'package:quotesy/quotesy.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    test('Fetching first element from quotes list', () async {
      final quotesArray = await Quotes.loadQuotes();
      expect(quotesArray.first.author, "Abraham Lincoln");
    });
  });
}
