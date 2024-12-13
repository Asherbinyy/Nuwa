import 'package:flutter/material.dart';

import 'enum/stylus_state.dart';

abstract class IStylusConnection {
  ValueNotifier<StylusState> get state;
  void connect();
  void disconnect();
}
