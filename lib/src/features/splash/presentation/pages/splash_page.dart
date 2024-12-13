import 'package:flutter/material.dart';
import 'package:nuwa/src/shared/ui_kit/builders/copy_rights_text_builder.dart';

import '../../../../core/di/di.dart';
import '../logic/splash_controller.dart';
import '../widgets/animated_logo.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final SplashController _controller = getIt<SplashController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: AnimatedLogoWidget(
                onAnimationComplete: _controller.onComplete,
              ),
            ),
          ),
          CopyRightsTextBuilder(),
        ],
      ),
    );
  }
}
