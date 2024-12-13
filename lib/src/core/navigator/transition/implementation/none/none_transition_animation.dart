import 'package:flutter/material.dart';

import '../../factory/transition_creator.dart';

class NoneTransitionAnimation implements TransitionCreator {
  const NoneTransitionAnimation();

  @override
  Widget animate(
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return child;
  }
}
