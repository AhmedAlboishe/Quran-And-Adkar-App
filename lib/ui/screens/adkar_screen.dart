import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:quran/services/adkar_service.dart';
import 'package:quran/services/theme_services.dart';
import 'package:quran/ui/size_config.dart';
import 'package:quran/ui/widgets/custom_counter.dart';

import 'package:quran/ui/widgets/custom_deker.dart';
import 'package:quran/ui/widgets/custom_exit_button.dart';
import 'package:rive/rive.dart';

class AdkarScreen extends StatefulWidget {
  const AdkarScreen({super.key, required this.title});
  final String title;
  @override
  State<AdkarScreen> createState() => _AdkarScreenState();
}

class _AdkarScreenState extends State<AdkarScreen>
    with AutomaticKeepAliveClientMixin {
  List adkar = [
    {
      'deker':
          'أَعُوذُ بِاللهِ مِنْ الشَّيْطَانِ الرَّجِيم\nاللّهُ لاَ إِلَـهَ إِلاَّ هُوَ الْحَيُّ الْقَيُّومُ لاَ تَأْخُذُهُ سِنَةٌ وَلاَ نَوْمٌ لَّهُ مَا فِي السَّمَاوَاتِ وَمَا فِي الأَرْضِ مَن ذَا الَّذِي يَشْفَعُ عِنْدَهُ إِلاَّ بِإِذْنِهِ يَعْلَمُ مَا بَيْنَ أَيْدِيهِمْ وَمَا خَلْفَهُمْ وَلاَ يُحِيطُونَ بِشَيْءٍ مِّنْ عِلْمِهِ إِلاَّ بِمَا شَاء وَسِعَ كُرْسِيُّهُ السَّمَاوَاتِ وَالأَرْضَ وَلاَ يَؤُودُهُ حِفْظُهُمَا وَهُوَ الْعَلِيُّ الْعَظِيمُ',
      'times': 1
    },
    {
      'deker':
          'بِسْمِ اللهِ الرَّحْمنِ الرَّحِيم\nقُلْ هُوَ ٱللَّهُ أَحَدٌ، ٱللَّهُ ٱلصَّمَدُ، لَمْ يَلِدْ وَلَمْ يُولَدْ، وَلَمْ يَكُن لَّهُۥ كُفُوًا أَحَدٌۢ',
      'times': 3
    },
    {
      'deker':
          'بِسْمِ اللهِ الرَّحْمنِ الرَّحِيم\nقُلْ أَعُوذُ بِرَبِّ ٱلْفَلَقِ، مِن شَرِّ مَا خَلَقَ، وَمِن شَرِّ غَاسِقٍ إِذَا وَقَبَ، وَمِن شَرِّ ٱلنَّفَّٰثَٰتِ فِى ٱلْعُقَدِ، وَمِن شَرِّ حَاسِدٍ إِذَا حَسَدَ',
      'times': 3
    },
    {
      'deker':
          'بِسْمِ اللهِ الرَّحْمنِ الرَّحِيم\nقُلْ أَعُوذُ بِرَبِّ ٱلنَّاسِ، مَلِكِ ٱلنَّاسِ، إِلَٰهِ ٱلنَّاسِ، مِن شَرِّ ٱلْوَسْوَاسِ ٱلْخَنَّاسِ، ٱلَّذِى يُوَسْوِسُ فِى صُدُورِ ٱلنَّاسِ، مِنَ ٱلْجِنَّةِ وَٱلنَّاسِ',
      'times': 3
    },
    {
      'deker':
          'أَصْـبَحْنا وَأَصْـبَحَ المُـلْكُ لله وَالحَمدُ لله ، لا إلهَ إلاّ اللّهُ وَحدَهُ لا شَريكَ لهُ، لهُ المُـلكُ ولهُ الحَمْـد، وهُوَ على كلّ شَيءٍ قدير ، رَبِّ أسْـأَلُـكَ خَـيرَ ما في هـذا اليوم وَخَـيرَ ما بَعْـدَه ، وَأَعـوذُ بِكَ مِنْ شَـرِّ ما في هـذا اليوم وَشَرِّ ما بَعْـدَه، رَبِّ أَعـوذُبِكَ مِنَ الْكَسَـلِ وَسـوءِ الْكِـبَر ، رَبِّ أَعـوذُ بِكَ مِنْ عَـذابٍ في النّـارِ وَعَـذابٍ في القَـبْر',
      'times': 1
    },
    {
      'deker':
          'اللّهـمَّ أَنْتَ رَبِّـي لا إلهَ إلاّ أَنْتَ ، خَلَقْتَنـي وَأَنا عَبْـدُك ، وَأَنا عَلـى عَهْـدِكَ وَوَعْـدِكَ ما اسْتَـطَعْـت ، أَعـوذُبِكَ مِنْ شَـرِّ ما صَنَـعْت ، أَبـوءُ لَـكَ بِنِعْـمَتِـكَ عَلَـيَّ وَأَبـوءُ بِذَنْـبي فَاغْفـِرْ لي فَإِنَّـهُ لا يَغْـفِرُ الذُّنـوبَ إِلاّ أَنْتَ',
      'times': 1
    },
    {
      'deker':
          'رَضيـتُ بِاللهِ رَبَّـاً وَبِالإسْلامِ ديـناً وَبِمُحَـمَّدٍ صلى الله عليه وسلم نَبِيّـاً',
      'times': 3
    },
    {
      'deker':
          'اللّهُـمَّ إِنِّـي أَصْبَـحْتُ أُشْـهِدُك ، وَأُشْـهِدُ حَمَلَـةَ عَـرْشِـك ، وَمَلَائِكَتَكَ ، وَجَمـيعَ خَلْـقِك ، أَنَّـكَ أَنْـتَ اللهُ لا إلهَ إلاّ أَنْـتَ وَحْـدَكَ لا شَريكَ لَـك ، وَأَنَّ ُ مُحَمّـداً عَبْـدُكَ وَرَسـولُـك',
      'times': 4
    },
    {
      'deker':
          'اللّهُـمَّ ما أَصْبَـَحَ بي مِـنْ نِعْـمَةٍ أَو بِأَحَـدٍ مِـنْ خَلْـقِك ، فَمِـنْكَ وَحْـدَكَ لا شريكَ لَـك ، فَلَـكَ الْحَمْـدُ وَلَـكَ الشُّكْـر',
      'times': 1
    },
  ];
  int count = 0;
  final adkarServices = AdkarServices();
  bool disposes = false;
  int disappearedCount = 0;
  bool showExit = false;
  int totalAdkar = 0;
  void _countOnTap() {
    count++;
    adkarServices.saveAdkarNumberToStorage(totalAdkar: count + totalAdkar);
  }

  @override
  void initState() {
    totalAdkar = adkarServices.loadTotalAdkarFromStorage();
    super.initState();
  }

  void _onDekerDisappear() {
    log('_onDekerDisappear $disappearedCount');
    disappearedCount++;
    if (disappearedCount == adkar.length) {
      // تنفيذ الكود الذي تريده عند اختفاء جميع العناصر
      // _showOverlayMessage("تم اختفاء جميع العناصر");
      totalAdkar = adkarServices.loadTotalAdkarFromStorage();
      setState(() {});
      Future.delayed(const Duration(milliseconds: 1200), () {
        if (mounted) {
          setState(() {
            showExit = true;
          });
        }
      });
    }
  }

  SMIBool? test;
  bool isDarkMode = Get.isDarkMode;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    // SizeConfig().init;
    return PopScope(
      canPop: showExit ? true : false,
      onPopInvoked: (didPop) {
        log('pop scope $didPop');
        totalAdkar = adkarServices.loadTotalAdkarFromStorage();
        setState(() {
          disposes = true;
        });
        Future.delayed(const Duration(milliseconds: 1200), () {
          if (mounted) {
            setState(() {
              showExit = true;
            });
          }
        });
        log('disposes $disposes');
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
            style: TextStyle(fontSize: getProportionateScreenWidth(15)),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: IconButton(
                  onPressed: () {
                    ThemeServices().switchThemeMode();
                    setState(() {
                      isDarkMode = !isDarkMode;
                    });
                  },
                  icon: Icon(isDarkMode
                      ? CupertinoIcons.sun_max
                      : Icons.dark_mode_outlined)),
            )
          ],
        ),
        body: PageStorage(
          bucket: PageStorageBucket(),
          child: disappearedCount != adkar.length && disposes == false
              ? AnimationLimiter(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: adkar.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return CustomDeker(
                          data: adkar[index],
                          onTapCount: _countOnTap,
                          onDisappear: _onDekerDisappear,
                        );
                      }),
                )
              : 1 == 2
                  ? Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // test!.change(true);
                          },
                          child: Column(
                            children: [
                              SizedBox(
                                height: getProportionateScreenWidth(100),
                                width: getProportionateScreenWidth(100),
                                child: RiveAnimation.asset(
                                  'assets/icons/aaa.riv',
                                  artboard: 'Tada',
                                  onInit: (artboard) {
                                    StateMachineController? controller =
                                        StateMachineController.fromArtboard(
                                            artboard, 'controller');
                                    artboard.addController(controller!);

                                    test = controller.findInput('isHover')
                                        as SMIBool?;
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                'أحسنت 👏\nداوم على قراءة الأذكار',
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomCounter(
                          title: 'عدد الأذكار التي قرأتها',
                          targetValue: count,
                        ),
                        CustomCounter(
                          title: 'مجموع الأذكار          ',
                          targetValue: totalAdkar,
                        ),
                        const Spacer(),
                        Visibility(
                          visible: showExit,
                          child: const CustomExitButton(),
                        ),
                        const Spacer(
                          flex: 2,
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // test!.change(true);
                          },
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              AnimationLimiter(
                                child: AnimationConfiguration.synchronized(
                                  // duration: const Duration(seconds: 1),
                                  child: ScaleAnimation(
                                    curve: Curves.fastOutSlowIn,
                                    duration:
                                        const Duration(milliseconds: 1500),
                                    child: SizedBox(
                                      height: getProportionateScreenWidth(100),
                                      width: getProportionateScreenWidth(100),
                                      child: RiveAnimation.asset(
                                        'assets/icons/aaa.riv',
                                        artboard: 'Tada',
                                        useArtboardSize: true,
                                        onInit: (artboard) {
                                          StateMachineController? controller =
                                              StateMachineController
                                                  .fromArtboard(
                                                      artboard, 'controller');
                                          artboard.addController(controller!);

                                          test = controller.findInput('isHover')
                                              as SMIBool?;
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                'أحسنت 👏\nداوم على قراءة الأذكار',
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomCounter(
                          title: 'مجموع الأذكار          ',
                          targetValue: totalAdkar,
                        ),
                        const Spacer(),
                        Visibility(
                          visible: showExit,
                          child: const CustomExitButton(),
                        ),
                        const Spacer(
                          flex: 2,
                        ),
                      ],
                    ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
