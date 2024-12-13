part of 'stylus_state.dart';

extension StylusStateExtension on StylusState {
  String get title {
    switch (this) {
      case StylusState.notConnected:
        return "Stylus is not connected";
      case StylusState.connecting:
        return "Connecting...";
      case StylusState.connected:
        return "Connected";
    }
  }

  String get message {
    switch (this) {
      case StylusState.notConnected:
        return "Please connect your stylus to start data collection.";
      case StylusState.connecting:
        return "Please wait for your stylus to be connected.";
      case StylusState.connected:
        return "Your stylus is connected. You can start data collection.";
    }
  }

  String get buttonTitle {
    switch (this) {
      case StylusState.notConnected:
        return "Connect Stylus";
      case StylusState.connecting:
        return "Start";
      case StylusState.connected:
        return "Start";
    }
  }

  Color get iconBackgroundColor {
    switch (this) {
      case StylusState.notConnected:
        return const Color(0xffEAECF0);
      case StylusState.connecting:
        return const Color(0xffF0F2FC);
      case StylusState.connected:
        return const Color(0xffEEF8F1);
    }
  }
}
