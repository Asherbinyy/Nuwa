import 'package:flutter/material.dart';

import '../generic_cubit/generic_cubit.dart';

typedef GenerousWidgetBuilder<T> = Widget Function(GenericState<T> state);
typedef GenericOptions = ({VoidCallback? onRedirect, bool isOnRefreshed});
