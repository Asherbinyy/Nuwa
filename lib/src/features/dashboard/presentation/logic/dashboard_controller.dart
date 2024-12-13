import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:nuwa/src/core/logger/app_logger.dart';
import 'package:nuwa/src/core/navigator/named_routes.dart';
import 'package:nuwa/src/core/navigator/navigator.dart';
import 'package:nuwa/src/shared/ui_kit/dialogs/app_dialogs.dart';

import '../../../../core/services/stylus/enum/stylus_state.dart';
import '../../../../core/services/stylus/stylus_connection_interface.dart';
import '../../../../shared/generics/generics.dart';
import '../widgets/imports_widgets_dashboard.dart';

@injectable
class DashboardController {
  final IStylusConnection _stylusConnection;

  late final GlobalKey<ScaffoldState> _scaffoldKey;
  late final GenericBloc<StylusState> _stylusStateCubit;

  DashboardController(this._stylusConnection);

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;
  GenericBloc<StylusState> get stylusStateCubit => _stylusStateCubit;

  void init() {
    _scaffoldKey = GlobalKey<ScaffoldState>();
    _stylusStateCubit = GenericBloc(_stylusConnection.state.value);

    _stylusConnection.state.addListener(_onStylusStateChanged);
  }

  void _onStylusStateChanged() {
    _stylusStateCubit.update(data: _stylusConnection.state.value);
    logger.d('Stylus state updated: ${_stylusConnection.state.value}');
  }

  void onDataCollectionPressed() {
    logger.d('Current stylus state: ${_stylusStateCubit.state.data}');

    AppDialogs.show(
      child: StylusDialog(
        state: _stylusStateCubit,
        onAction: () {
          if (_stylusStateCubit.state.data == StylusState.notConnected) {
            _stylusConnection.connect();
          } else {
            logger('Navigating to data collection screen');
            if (AppDialogs.isDialogOpen) {
              Go.back();
            }
            Go.toNamed(NamedRoutes.dataCollection);
          }
        },
      ),
    );
  }

  void dispose() {
    _stylusConnection.state.removeListener(_onStylusStateChanged);
  }
}
