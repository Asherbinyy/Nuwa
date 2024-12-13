import '../../generic_cubit/generic_cubit.dart';

extension NullValues<T> on Future<GenericState<T>>? {
  Future<GenericState<T>> get orNull =>
      this ?? Future.value(const EmptyState());
}
