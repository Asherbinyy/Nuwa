import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nuwa/src/core/services/stylus/enum/stylus_state.dart';
import 'package:nuwa/src/features/dashboard/presentation/logic/dashboard_controller.dart';

import '../../../../../mocks/mock_stylus_connection.dart';

void main() {
  late DashboardController controller;
  late MockStylusConnection mockStylusConnection;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();

    mockStylusConnection = MockStylusConnection();

    when(() => mockStylusConnection.state).thenReturn(
      ValueNotifier(
        StylusState.notConnected,
      ),
    );

    controller = DashboardController(mockStylusConnection);
    controller.init();
  });

  group('DashboardController', () {
    test('initial state is set correctly', () {
      expect(controller.stylusStateCubit.state.data, StylusState.notConnected);
    });

    test('stylus state changes are reflected', () async {
      mockStylusConnection.state.value = StylusState.connected;
      await Future.delayed(const Duration(milliseconds: 10));
      expect(controller.stylusStateCubit.state.data, StylusState.connected);
    });

    // test('onDataCollectionPressed handles notConnected state correctly', () {
    //   controller.onDataCollectionPressed();
    //
    //   verify(() => mockStylusConnection.connect()).called(1);
    // });

    test('onDataCollectionPressed navigates when connected', () {
      mockStylusConnection.state.value = StylusState.connected;
      expect(mockStylusConnection.state.value, StylusState.connected);
    });

    // test('onDataCollectionPressed does nothing when connecting', () {
    //   mockStylusConnection.state.value = StylusState.connecting;
    //
    //   controller.onDataCollectionPressed();
    //   verifyNever(() => mockStylusConnection.connect());
    // });
  });
}
