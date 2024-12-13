part of 'imports_page_router_builder.dart';

class PageRouterBuilder {
  PageRouterBuilder._();

  factory PageRouterBuilder() => _instance;
  static final PageRouterBuilder _instance = PageRouterBuilder._();

  PageRouterCreator _creator = CustomPageRouterCreator();

  void initAppRouter({
    PlatformConfig? config,
  }) {
    if (kIsWeb) {
      _creator = config?.web ??
          CustomPageRouterCreator(parentTransition: TransitionType.fade);
    } else if (defaultTargetPlatform == TargetPlatform.android) {
      _creator = config?.android ?? MaterialPageRouterCreator();
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      _creator = config?.ios ?? CupertinoPageRouterCreator();
    } else {
      _creator = CustomPageRouterCreator();
    }
  }

  Route<T> build<T>(
    Widget page, {
    RouteSettings? settings,
    TransitionType? transition,
    AnimationOption? options,
  }) {
    return _creator.create<T>(
      page,
      settings: settings,
      transition: transition,
      animationOptions: options,
    );
  }
}

class PlatformConfig {
  final PageRouterCreator? android;
  final PageRouterCreator? ios;
  final PageRouterCreator? web;

  PlatformConfig({
    this.android,
    this.ios,
    this.web,
  });
}
