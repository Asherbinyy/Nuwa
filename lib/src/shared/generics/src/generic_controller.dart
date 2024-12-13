import 'package:nuwa/src/shared/generics/src/generic_cubit/generic_cubit.dart';
import 'package:nuwa/src/shared/generics/src/utils/mixins/generic_mixin.dart';

abstract class GenericController<T> extends GenericBloc<T>
    with GenericMixin<T> {
  GenericController() : super(null);

  @override
  void emit(GenericState<T> state) {
    super.emit(state);
  }
}
