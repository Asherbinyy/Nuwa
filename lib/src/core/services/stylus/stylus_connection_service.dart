import 'dart:async';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:nuwa/src/core/services/stylus/stylus_connection_interface.dart';

import 'enum/stylus_state.dart';

@LazySingleton(as: IStylusConnection)
class StylusConnectionService implements IStylusConnection {
  final ValueNotifier<StylusState> _state =
      ValueNotifier(StylusState.notConnected);
  Timer? _connectionTimer;

  @override
  ValueNotifier<StylusState> get state => _state;

  @override
  void connect() {
    if (_state.value == StylusState.connected) return;

    _state.value = StylusState.connecting;

    _connectionTimer = Timer(const Duration(seconds: 3), () {
      _state.value = StylusState.connected;
    });
  }

  @override
  void disconnect() {
    _connectionTimer?.cancel();
    _state.value = StylusState.notConnected;
  }

  void dispose() {
    _connectionTimer?.cancel();
    _state.dispose();
  }
}
