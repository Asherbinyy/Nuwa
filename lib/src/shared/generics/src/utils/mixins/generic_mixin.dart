import '../../../../../core/logger/app_logger.dart';

mixin GenericMixin<T> {
  // void update(GenericState<T> value);

  void init() {
    logger('init called from GenericMixin');

    /// TODO: implement init
  }

  void dispose() {
    logger('dispose called from GenericMixin');

    /// TODO: implement dispose
  }
}
