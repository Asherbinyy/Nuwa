import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuwa/src/core/navigator/go_generator.dart';
import 'package:nuwa/src/core/navigator/named_routes.dart';

import 'core/navigator/navigator.dart';
import 'core/resources/constants/app_constants.dart';
import 'core/resources/styles/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: AppConstants.screenSize,
      minTextAdapt: true,
      ensureScreenSize: true,
      builder: (_, child) {
        child = MaterialApp(
          navigatorKey: Go.navigatorKey,
          debugShowCheckedModeBanner: false,
          title: AppConstants.appName,
          theme: AppTheme.light,
          onGenerateRoute: GoGenerator.getRoute,
          initialRoute: NamedRoutes.splash.routeName,
        );
        return MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: TextScaler.linear(1.0)),
          child: child,
        );
      },
    );
  }
}
