import '../../generic_cubit/generic_cubit.dart';

extension GenericStateExtension<T> on GenericState<T> {
  bool get isEmptyState => this is EmptyState;
  bool get isInitial => this is InitialState;
  bool get isLoading => this is LoadingState;
  bool get isNotLoading => !isLoading;
  bool get isSuccess => this is SuccessState;
  bool get isFailed => this is FailedState;

  void when({
    required void Function(T? data, String? message) success,
    void Function(String? error)? failure,
  }) {
    if (this is SuccessState) {
      success(data, message);
    } else if (this is FailedState) {
      failure?.call(message ?? error);
    } else {
      return;
    }
  }
}
