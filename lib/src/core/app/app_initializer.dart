import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:nuwa/src/core/di/di.dart';
import 'package:nuwa/src/core/navigator/constants/imports_constants.dart';
import 'package:nuwa/src/core/navigator/page_router/imports_page_router_builder.dart';

import '../../shared/generics/src/bloc_observer/bloc_observer.dart';
import '../navigator/page_router/implementation/imports_page_router.dart';

class AppInitializer {
  AppInitializer._();

  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    Bloc.observer = AppBlocObserver();
    setupDependencies();
    PageRouterBuilder().initAppRouter(
      config: PlatformConfig(
        android: CupertinoPageRouterCreator(),
        ios: CupertinoPageRouterCreator(),
        web: CustomPageRouterCreator(parentTransition: TransitionType.fade),
      ),
    );
  }
}
