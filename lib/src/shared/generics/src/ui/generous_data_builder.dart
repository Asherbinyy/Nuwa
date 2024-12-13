part of 'imports_data_builder.dart';

class GenerousDataBuilder<T> extends StatelessWidget {
  const GenerousDataBuilder({
    super.key,
    required this.init,
    required this.builder,
    @Deprecated('Don\'t use it now') this.emptyData,
    this.initial,
    this.error,
    this.loading,
    this.buildWhen,
    this.isOnRefreshed = false,
    this.onRedirect,
  });

  final BlocBuilderCondition<GenericState<T>>? buildWhen;
  final GenericBloc<T>? init;

  final Widget Function(T? data)? initial;
  final Widget Function(T? data, String? _) builder;
  final GenerousWidgetBuilder<T>? emptyData;
  final Widget Function(String? _)? error;
  final Widget? loading;
  final bool isOnRefreshed;
  final Function()? onRedirect;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<T>, GenericState<T>>(
      bloc: init,
      buildWhen: buildWhen,
      builder: (context, state) {
        return GenericDataBuilder(
          state: state,
          builder: builder(state.data, state.message),
          initial: initial == null ? null : initial!(state.data),
          emptyData: emptyData != null ? emptyData!(state) : null,
          error: error != null ? error!(state.error) : null,
          loading: loading,
          onRedirect: onRedirect,
          isOnRefreshed: isOnRefreshed,
        );
      },
    );
  }

  factory GenerousDataBuilder.empty({
    required GenericBloc<T> init,
    required final Widget Function(T? data) builder,
  }) {
    return GenerousDataBuilder<T>(
      init: init,
      builder: (data, _) => builder(data),
      initial: null,
      error: null,
      loading: null,
      onRedirect: null,
      isOnRefreshed: false,
    );
  }
}
