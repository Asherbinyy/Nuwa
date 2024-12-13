import 'package:flutter/material.dart';
import 'package:nuwa/src/core/resources/assets/app_icons.dart';
import 'package:nuwa/src/core/utils/extensions/screen_spaces_x.dart';

class AnimatedLogoWidget extends StatefulWidget {
  final VoidCallback onAnimationComplete;

  const AnimatedLogoWidget({
    super.key,
    required this.onAnimationComplete,
  });

  @override
  AnimatedLogoWidgetState createState() => AnimatedLogoWidgetState();
}

class AnimatedLogoWidgetState extends State<AnimatedLogoWidget>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _waveAnimation;

  Offset _textOffset = Offset(0.0, -10.0);
  final _textOffsetDuration = const Duration(milliseconds: 500);
  bool _isTextVisible = false;
  @override
  void initState() {
    setAnimations();
    super.initState();
  }

  void setAnimations() {
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeInOut),
      ),
    );

    _waveAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1.0, curve: Curves.easeInOut),
      ),
    );
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _textOffset = Offset(0, 0);
          _isTextVisible = true;
          Future.delayed(_textOffsetDuration, () {
            widget.onAnimationComplete();
          });
        });
      }
    });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return ScaleTransition(
              scale: _scaleAnimation,
              child: Transform.rotate(
                angle: _waveAnimation.value * 6.3,
                child: Hero(
                  tag: 'logo',
                  child: Image.asset(
                    AppIcons.logoButterfly,
                    width: 200.toH(),
                  ),
                ),
              ),
            );
          },
        ),
        if (_isTextVisible)
          AnimatedSlide(
            duration: _textOffsetDuration,
            offset: _textOffset,
            child: Image.asset(
              AppIcons.logoText,
              width: 200.toH(),
            ),
          ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
