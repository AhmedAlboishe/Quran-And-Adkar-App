import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AnimationWidget extends StatelessWidget {
  const AnimationWidget({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: 0,
      child: SlideAnimation(
        duration: const Duration(milliseconds: 2000),
        curve: Curves.fastLinearToSlowEaseIn,
        child: FadeInAnimation(
          curve: Curves.fastLinearToSlowEaseIn,
          duration: const Duration(milliseconds: 2500),
          child: AnimatedSize(
            duration: const Duration(milliseconds: 1200),
            curve: Curves.easeOutExpo,
            child: child,
          ),
        ),
      ),
    );
  }
}
