import 'package:injectable/injectable.dart';
import 'package:nuwa/src/core/navigator/named_routes.dart';
import 'package:nuwa/src/core/navigator/navigator.dart';

@injectable
class SplashController {
  void onComplete() {
    Go.offAllNamed(NamedRoutes.dashboard);
  }
}
