import 'package:flutter/material.dart';

import '../../resources/constants/app_constants.dart';

extension ContextX on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  bool get isMobile => mediaQuery.size.width < kTabletBreakpoint;
}
