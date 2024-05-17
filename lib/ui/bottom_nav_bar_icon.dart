import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:quran/ui/theme.dart';

import 'screens/adkar/all_adkar_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/quran/suras_screen.dart';
import 'screens/settings/settings_screen.dart';

const Color bottonNavBgColor = Color(0xff17203A);

class BottonNavWithAnimatedIcons extends StatefulWidget {
  const BottonNavWithAnimatedIcons({super.key});
  @override
  State<BottonNavWithAnimatedIcons> createState() =>
      _BottonNavWithAnimatedIconsState();
}

class _BottonNavWithAnimatedIconsState
    extends State<BottonNavWithAnimatedIcons> {
  List<String> iconInputs = [
    'assets/icons/home.png',
    'assets/icons/book-open.png',
    'assets/icons/grid.png',
    'assets/icons/settings.png',
  ];
  int selectedNavIndex = 0;
  List<Widget> pages = [
    const HomeScreen(),
    const SurasScreen(),
    const AllAdkarScreen(),
    const SettingsScreen(),
  ];
  final PageController controller = PageController(initialPage: 0);

  // loadImage() async {
  //   try {
  //     await precacheImage(
  //         const AssetImage('assets/images/sunrise.jpg'), context);
  //     print('*--Finish:: ✅✅');
  //   } catch (e) {
  //     print('*--error:: $e');
  //   }
  // }

  // Future.delayed(Duration.zero, loadImage);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
          4,
          (index) => pages[index],
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(left: 24, right: 24, bottom: 15),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: context.theme.colorScheme.background,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
              color: Get.isDarkMode
                  ? white.withOpacity(0.15)
                  : black.withOpacity(0.15)),
          boxShadow: [
            BoxShadow(
                color: context.theme.colorScheme.onSurface.withOpacity(0.05),
                offset: const Offset(0, 5),
                blurRadius: 20)
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            4,
            (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedNavIndex = index;
                  });
                  controller.jumpToPage(index);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedBar(
                      isActive: selectedNavIndex == index,
                    ),
                    SizedBox(
                      // height: 36,
                      width: 42,
                      child: Opacity(
                        opacity: selectedNavIndex == index ? 1 : 0.5,
                        child: Image.asset(
                          iconInputs[index],
                          color: context.theme.colorScheme.onSurface,
                          height: selectedNavIndex == index ? 36 : 30,
                          scale: selectedNavIndex == index ? 2.9 : 2,
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
      // bottomNavigationBar: Container(
      //   // margin: const EdgeInsets.only(left: 24, right: 24, bottom: 15),
      //   padding: const EdgeInsets.all(12),
      //   decoration: BoxDecoration(
      //     // color: Colors.white,
      //     color: context.theme.colorScheme.background,
      //     border: Border(
      //       top: BorderSide(
      //           color: Get.isDarkMode
      //               ? white.withOpacity(0.15)
      //               : black.withOpacity(0.15)),
      //     ),
      //     // borderRadius: BorderRadius.circular(24),
      //   ),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     children: List.generate(
      //       4,
      //       (index) {
      //         return GestureDetector(
      //           onTap: () {
      //             setState(() {
      //               selectedNavIndex = index;
      //             });
      //             controller.jumpToPage(index);
      //           },
      //           child: Column(
      //             mainAxisSize: MainAxisSize.min,
      //             children: [
      //               AnimatedBar(
      //                 isActive: selectedNavIndex == index,
      //               ),
      //               SizedBox(
      //                 // height: 36,
      //                 width: 42,
      //                 child: Opacity(
      //                   opacity: selectedNavIndex == index ? 1 : 0.5,
      //                   child: Image.asset(
      //                     iconInputs[index],
      //                     color: context.theme.colorScheme.onSurface,
      //                     height: selectedNavIndex == index ? 36 : 30,
      //                     scale: selectedNavIndex == index ? 2.9 : 2,
      //                   ),
      //                 ),
      //               ),
      //             ],
      //           ),
      //         );
      //       },
      //     ),
      //   ),
      // ),
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
        color: context.theme.colorScheme.onSecondary,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
