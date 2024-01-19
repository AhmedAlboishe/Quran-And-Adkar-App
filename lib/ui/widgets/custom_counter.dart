import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:quran/ui/size_config.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class CustomCounter extends StatefulWidget {
  const CustomCounter({
    super.key,
    required this.targetValue,
    required this.title,
  });

  final int targetValue;
  final String title;

  @override
  State<CustomCounter> createState() => _CustomCounterState();
}

class _CustomCounterState extends State<CustomCounter>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _animation;
  int targetValue = 0;

  @override
  void initState() {
    super.initState();
    targetValue = widget.targetValue;
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _animation = IntTween(
            begin: targetValue >= 100 ? targetValue ~/ 1.5 : 0,
            end: targetValue)
        .animate(_controller);

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    // SizeConfig().init;

    return AnimationConfiguration.staggeredList(
      position: 0,
      child: SlideAnimation(
        duration: const Duration(milliseconds: 2500),
        curve: Curves.fastLinearToSlowEaseIn,
        child: FadeInAnimation(
          curve: Curves.fastLinearToSlowEaseIn,
          duration: const Duration(milliseconds: 2500),
          child: Container(
            height: getProportionateScreenWidth(80),
            decoration: BoxDecoration(
              border: Border.all(
                color: Get.isDarkMode ? Colors.white70 : Colors.black54,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
            child: Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: WaveWidget(
                    config: CustomConfig(
                      colors: [
                        context.theme.colorScheme.onSecondary.withOpacity(0.1),
                        context.theme.colorScheme.onSecondary.withOpacity(0.1),
                        context.theme.colorScheme.onSecondary.withOpacity(0.1),
                      ],
                      durations: [9000, 8000, 7000],
                      heightPercentages: [
                        0.50,
                        0.55,
                        0.52,
                      ],
                    ),
                    size:
                        Size(double.infinity, getProportionateScreenWidth(80)),
                    waveAmplitude: 0,
                    waveFrequency: 3,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                            fontSize: getProportionateScreenWidth(13)),
                      ),
                      const Spacer(
                        flex: 2,
                      ),
                      AnimatedBuilder(
                        animation: _animation,
                        builder: (context, child) => Text(
                          '${_animation.value}',
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(28)),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
