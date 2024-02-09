import 'grammar_parser.dart';
import 'parser_error.dart';

class Grammar {
  static dynamic parse(String input, String startRule) {
    GrammarParser parser = GrammarParser(startRule); // Pass startRule here
    dynamic result = parser.parse(input, startRule);
    if (!parser.success) {
      List<ParserErrorMessage> messages = <ParserErrorMessage>[];
      for (GrammarParserError error in parser.errors()) {
        messages.add(ParserErrorMessage(
            error.message, error.start, error.position));
      }

      List<String> strings =
          ParserErrorFormatter.format(parser.text, messages);
      print('Parsing error occurred:');
      print('Input: $input');
      print('Start Rule: $startRule');
      print(strings.join('\n'));
      throw FormatException(
          'Parsing error occurred. See logs for details.'); // Provide a meaningful message
    }
    return result;
  }
}

