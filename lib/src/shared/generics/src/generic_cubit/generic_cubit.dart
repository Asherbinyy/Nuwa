import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'generic_state.dart';

class GenericBloc<T> extends Cubit<GenericState<T>> {
  T? data;
  GenericBloc(this.data) : super(InitialState<T>(data: data));

  void update({T? data}) {
    if (data == null) {
      emit(const InitialState());
    } else {
      emit(SuccessState<T>(data));
    }
  }
}
