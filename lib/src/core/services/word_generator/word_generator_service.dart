import 'dart:math';

import 'package:injectable/injectable.dart';

import 'word_generator_interface.dart';

@LazySingleton(as: IWordGenerator)
class WordGeneratorService implements IWordGenerator {
  @override
  String generate() {
    final random = Random();
    return _words[random.nextInt(_words.length)];
  }

  static List<String> get words => _words;
  static const List<String> _words = [
    'Lorem',
    'Ipsum',
    'Dolor',
    'Sit',
    'Amet',
    'Adipiscing',
    'Elit',
    'Consectetur',
    'Vivamus',
    'Curabitur',
    'Sagittis',
    'Faucibus',
    'Mauris',
    'Phasellus',
    'Nunc',
    'Orci',
    'Gravida',
    'Lacinia',
    'Cras',
    'Hendrerit',
    'Ultricies',
    'Egestas',
    'Nullam',
    'Venenatis',
    'Porttitor',
    'Integer',
    'Fermentum',
    'Suspendisse',
    'Ornare',
    'Eget',
    'Rhoncus',
    'Pellentesque',
    'Aliquam',
    'Tristique',
    'Facilisis'
  ];
}
