part of 'imports_data_builder.dart';

class GenerousValueBuilder<T> extends StatelessWidget {
  const GenerousValueBuilder({
    super.key,
    required this.value,
    required this.builder,
    this.buildWhen,
  });

  final BlocBuilderCondition<GenericState<T>>? buildWhen;
  final GenericBloc<T>? value;
  final Widget Function(T? data) builder;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<T>, GenericState<T>>(
      bloc: value,
      buildWhen: buildWhen,
      builder: (context, state) {
        return builder(state.data);
      },
    );
  }
}
