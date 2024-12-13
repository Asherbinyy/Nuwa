import 'package:flutter/material.dart';
import 'package:nuwa/src/app.dart';
import 'package:nuwa/src/core/app/app_initializer.dart';

Future<void> main() async {
  await AppInitializer.initialize();

  runApp(const App());
}
