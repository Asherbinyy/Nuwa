import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nuwa/src/core/services/stylus/enum/stylus_state.dart';

void main() {
  group('StylusStateExtension', () {
    test('title returns correct values', () {
      expect(StylusState.notConnected.title, "Stylus is not connected");
      expect(StylusState.connecting.title, "Connecting...");
      expect(StylusState.connected.title, "Connected");
    });

    test('message returns correct values', () {
      expect(StylusState.notConnected.message,
          "Please connect your stylus to start data collection.");
      expect(StylusState.connecting.message,
          "Please wait for your stylus to be connected.");
      expect(StylusState.connected.message,
          "Your stylus is connected. You can start data collection.");
    });

    test('buttonTitle returns correct values', () {
      expect(StylusState.notConnected.buttonTitle, "Connect Stylus");
      expect(StylusState.connecting.buttonTitle, "Start");
      expect(StylusState.connected.buttonTitle, "Start");
    });

    test('iconBackgroundColor returns correct colors', () {
      expect(StylusState.notConnected.iconBackgroundColor,
          const Color(0xffEAECF0));
      expect(
          StylusState.connecting.iconBackgroundColor, const Color(0xffF0F2FC));
      expect(
          StylusState.connected.iconBackgroundColor, const Color(0xffEEF8F1));
    });
  });
}
