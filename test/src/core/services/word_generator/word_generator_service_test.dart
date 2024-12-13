import 'package:flutter_test/flutter_test.dart';
import 'package:nuwa/src/core/services/word_generator/word_generator_service.dart';

void main() {
  late WordGeneratorService wordGeneratorService;

  setUp(() {
    wordGeneratorService = WordGeneratorService();
  });

  group('WordGeneratorService', () {
    test('should generate random words from the predefined list', () {
      final word = wordGeneratorService.generate();
      expect(WordGeneratorService.words, contains(word));
    });
  });
}
