import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran/ui/size_config.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class TotalAdkar extends StatefulWidget {
  const TotalAdkar({
    super.key,
    required this.targetValue,
  });
  final int targetValue;

  @override
  State<TotalAdkar> createState() => _TotalAdkarState();
}

class _TotalAdkarState extends State<TotalAdkar> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _animation;
  int targetValue = 0;

  init() {
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
    init();
    return Container(
      // height: getProportionateScreenHeight(150),
      padding: EdgeInsets.only(
        // top: getProportionateScreenHeight(5),
        top: getProportionateScreenHeight(60),
      ),
      decoration: BoxDecoration(
        // color: context.theme.colorScheme.onSecondary.withOpacity(0.5),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        // color: context.theme.colorScheme.onSecondary.withOpacity(0.1),
        gradient: LinearGradient(
          colors: [
            context.theme.colorScheme.onSecondary.withOpacity(0.5),
            context.theme.colorScheme.onSecondary.withOpacity(0.4),
            context.theme.colorScheme.onSecondary.withOpacity(0.3),
            context.theme.colorScheme.onSecondary.withOpacity(0.2),
            context.theme.colorScheme.onSecondary.withOpacity(0.1),
          ],
          begin: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(29),
            child: WaveWidget(
              config: CustomConfig(
                colors: [
                  context.theme.colorScheme.onSecondary.withOpacity(0.2),
                  context.theme.colorScheme.onSecondary.withOpacity(0.2),
                  context.theme.colorScheme.onSecondary.withOpacity(0.2),
                ],
                durations: [9000, 8000, 7000],
                heightPercentages: [
                  0.40,
                  0.45,
                  0.42,
                ],
              ),
              size: Size(double.infinity, getProportionateScreenWidth(80)),
              waveAmplitude: 0,
              waveFrequency: 3,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Align(
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'مجموع الأذكار التي قرأتها',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: getProportionateScreenWidth(14)),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) => Text(
                      '${_animation.value}',
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: getProportionateScreenWidth(28)),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
