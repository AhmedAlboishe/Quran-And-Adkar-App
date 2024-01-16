import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quran/ui/screens/fav_screen.dart';
import 'package:quran/ui/screens/home_screen.dart';
import 'package:quran/ui/screens/quran_screen.dart';
import 'package:quran/ui/screens/settings_screen.dart';

const Color bottonNavBgColor = Color(0xff17203A);

class BottonNavWithAnimatedIcons extends StatefulWidget {
  const BottonNavWithAnimatedIcons({super.key});
  @override
  State<BottonNavWithAnimatedIcons> createState() =>
      _BottonNavWithAnimatedIconsState();
}

class _BottonNavWithAnimatedIconsState
    extends State<BottonNavWithAnimatedIcons> {
  List<IconData> iconInputs = [
    CupertinoIcons.home,
    Icons.mosque_outlined,
    CupertinoIcons.heart,
    CupertinoIcons.gear,
  ];
  int selectedNavIndex = 0;
  List<Widget> pages = [
    const HomeScreen(),
    const QuranScreen(),
    const FavScreen(),
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
                      height: 36,
                      width: 42,
                      child: Opacity(
                        opacity: selectedNavIndex == index ? 1 : 0.5,
                        child: Icon(
                          iconInputs[index],
                          color: Colors.white,
                          size: selectedNavIndex == index ? 30 : 27,
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
