import 'package:flutter/material.dart';
import 'package:nuwa/src/features/splash/presentation/pages/splash_page.dart';

import '../../features/dashboard/presentation/pages/imports_dashboard.dart';
import '../../features/date_collection/presentation/imports_data_collection.dart';
import 'named_routes.dart';

class GoGenerator {
  GoGenerator._();

  static Route<dynamic> getRoute(RouteSettings settings) {
    final namedRoute = NamedRoutes.values.firstWhere(
      (e) => e.routeName == settings.name,
    );
    return switch (namedRoute) {
      NamedRoutes.splash =>
        MaterialPageRoute(builder: (_) => const SplashPage()),
      NamedRoutes.dashboard =>
        MaterialPageRoute(builder: (_) => const DashboardPage()),
      NamedRoutes.dataCollection =>
        MaterialPageRoute(builder: (_) => const DataCollectionPage()),
      // _ => undefineRoute(),
    };
  }

  static Route<dynamic> undefineRoute() {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        body: Center(
          child: Text('No route exists here ! '),
        ),
      ),
    );
  }
}
