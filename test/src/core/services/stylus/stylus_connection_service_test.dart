import 'package:flutter_test/flutter_test.dart';
import 'package:nuwa/src/core/services/stylus/enum/stylus_state.dart';
import 'package:nuwa/src/core/services/stylus/stylus_connection_service.dart';

void main() {
  late StylusConnectionService stylusConnectionService;

  setUp(() {
    stylusConnectionService = StylusConnectionService();
  });

  group('StylusConnectionService', () {
    test('should transition to connecting and then connected state on connect',
        () async {
      stylusConnectionService.connect();
      expect(stylusConnectionService.state.value, StylusState.connecting);

      await Future.delayed(Duration(seconds: 3));
      expect(stylusConnectionService.state.value, StylusState.connected);
    });

    test('should transition to notConnected state on disconnect', () {
      stylusConnectionService.connect();
      stylusConnectionService.disconnect();
      expect(stylusConnectionService.state.value, StylusState.notConnected);
    });
  });
}
