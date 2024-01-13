import 'package:flutter/material.dart';
import 'package:quran/model/nav_item_model.dart';
import 'package:quran/screens/home_screen.dart';
import 'package:rive/rive.dart';

const Color bottonNavBgColor = Color(0xff17203A);

class BottonNavWithAnimatedIcons extends StatefulWidget {
  const BottonNavWithAnimatedIcons({super.key});

  @override
  State<BottonNavWithAnimatedIcons> createState() =>
      _BottonNavWithAnimatedIconsState();
}

class _BottonNavWithAnimatedIconsState
    extends State<BottonNavWithAnimatedIcons> {
  List<SMIBool> riveIconInputs = [];
  List<StateMachineController?> controllers = [];
  int selectedNavIndex = 0;
  List<Widget> pages = [
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
  ];

  void animatedTheIcon(int index) {
    riveIconInputs[index].change(true);
    Future.delayed(const Duration(seconds: 1), () {
      riveIconInputs[index].change(false);
    });
  }

  riveOnInint(Artboard artboard, {required String stateMachineName}) {
    StateMachineController? controller = StateMachineController.fromArtboard(
      artboard,
      stateMachineName,
    );

    artboard.addController(controller!);

    controllers.add(controller);
    riveIconInputs.add(controller.findInput<bool>('active') as SMIBool);
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller?.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedNavIndex],
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: bottonNavBgColor.withOpacity(0.8),
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
                color: bottonNavBgColor.withOpacity(0.3),
                offset: const Offset(0, 20),
                blurRadius: 20)
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            bottonNavItems.length,
            (index) {
              final riveIcon = bottonNavItems[index].rive;
              return GestureDetector(
                onTap: () {
                  animatedTheIcon(index);
                  setState(() {
                    selectedNavIndex = index;
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedBar(
                      isActive: selectedNavIndex == index,
                    ),
                    SizedBox(
                      height: 36,
                      width: 36,
                      child: Opacity(
                        opacity: selectedNavIndex == index ? 1 : 0.5,
                        child: RiveAnimation.asset(
                          riveIcon.src,
                          artboard: riveIcon.artboard,
                          onInit: (artboard) {
                            riveOnInint(artboard,
                                stateMachineName: riveIcon.stateMachineName);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class AnimatedBar extends StatelessWidget {
  const AnimatedBar({
    super.key,
    required this.isActive,
  });
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: 4,
      width: isActive ? 25 : 0,
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(bottom: 2),
      decoration: BoxDecoration(
        color: const Color(0xff81b4ff),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
