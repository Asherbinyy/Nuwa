part of 'imports_data_builder.dart';

class GenericDataBuilder<T> extends StatefulWidget {
  const GenericDataBuilder({
    super.key,
    required this.state,
    required this.builder,
    this.emptyData,
    this.initial,
    this.error,
    this.loading,
    this.isOnRefreshed = false,
    this.onRedirect,
  });

  final GenericState<T> state;
  final Widget? initial;
  final Widget builder;
  final Widget? emptyData;
  final Widget? error;
  final Widget? loading;
  final bool isOnRefreshed;
  final Function()? onRedirect;
  @override
  State<GenericDataBuilder<T>> createState() => _GenericDataBuilderState<T>();

  factory GenericDataBuilder.empty({
    required GenericState<T> state,
    required Widget onDoneBuild,
  }) {
    return GenericDataBuilder(
      state: state,
      builder: onDoneBuild,
      initial: const SizedBox.shrink(),
      error: const SizedBox.shrink(),
      loading: const SizedBox.shrink(),
      emptyData: const SizedBox.shrink(),
      isOnRefreshed: false,
      onRedirect: null,
    );
  }
}

class _GenericDataBuilderState<T> extends State<GenericDataBuilder<T>>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _controller.forward();
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
        opacity: _animation,
        child: Builder(
          builder: (context) {
            switch (widget.state) {
              case (InitialState _):
                return widget.initial ?? const SizedBox.shrink();
              case (LoadingState _):
                return (widget.isOnRefreshed)
                    ? const SizedBox.shrink()
                    : (widget.loading ?? const CupertinoActivityIndicator());
              case (SuccessState _):
                return widget.builder;
              case (EmptyState _):
                return widget.emptyData ?? widget.builder;
              case (FailedState _):
                return widget.error ?? Text('Error occured');

              default:
                return widget.loading ??
                    ((widget.isOnRefreshed)
                        ? const SizedBox.shrink()
                        : const AppLoader());
            }
          },
        ));
  }
}
