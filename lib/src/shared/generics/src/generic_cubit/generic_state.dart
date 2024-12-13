part of 'generic_cubit.dart';

abstract class GenericState<T> extends Equatable {
  final T? data;
  final String? error;
  final String? message;

  const GenericState({
    this.data,
    this.error,
    this.message,
  });

  @override
  bool? get stringify => true;
}

class InitialState<T> extends GenericState<T> {
  const InitialState({super.data});

  @override
  List<Object?> get props => [data];
}

class LoadingState<T> extends GenericState<T> {
  const LoadingState() : super();

  @override
  List<Object?> get props => [];
}

class SuccessState<T> extends GenericState<T> {
  const SuccessState(
    T data, {
    super.message,
  }) : super(
          data: data,
        );

  @override
  List<Object?> get props => [data, message];
}

class EmptyState<T> extends GenericState<T> {
  const EmptyState({super.message});

  @override
  List<Object?> get props => [message];
}

class FailedState<T> extends GenericState<T> {
  const FailedState(String error, {super.message}) : super(error: error);

  @override
  List<Object?> get props => [error, message];
}
