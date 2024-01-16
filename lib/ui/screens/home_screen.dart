import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quran/ui/widgets/custom_ayaa.dart';
import 'package:quran/ui/widgets/custom_category.dart';
import 'package:quran/ui/widgets/custom_praise.dart';
import 'package:quran/ui/widgets/cutom_details.dart';
import 'package:quran/ui/widgets/cutom_names.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  late final String getData;
  final random = Random();
  List nameOfAllah = [
    '1: وهو الاسم الأعظم الذي تفرد به الحق سبحانه وخص به نفسه وجعله أول أسمائه، وأضافها كلها إليه فهو علم على ذاته سبحانه',
    '2: كثير الرحمة وهو اسم مقصور على الله عز وجل ولا يجوز أن يقال رحمن لغير الله، وذلك لأن رحمته وسعت كل شيء وهو أرحم الراحمين',
    '3: هو المنعم أبدا، المتفضل دوما، فرحمته لا تنتهي',
    '4: هو الله، ملك الملوك، له الملك، وهو مالك يوم الدين، ومليك الخلق فهو المالك المطلق',
    '5: هو الطاهر المنزه عن العيوب والنقائص وعن كل ما تحيط به العقول',
  ];

  String getRandomValue() {
    final randomIndex = random.nextInt(nameOfAllah.length);
    return nameOfAllah[randomIndex];
  }

  @override
  void initState() {
    getData = getRandomValue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'تـدبَّـر',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
        ),
      ),
      body: PageStorage(
        bucket: PageStorageBucket(),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const CustomDetails(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomCategory(
                  title: 'أذكار الصباح',
                  asset: 'assets/images/sunrise.jpg',
                ),
                CustomCategory(
                  title: 'أذكار المساء',
                  asset: 'assets/images/sunset.jpg',
                ),
              ],
            ),
            const CustomAyaa(
              ayaa:
                  '(وَمَن يَعْمَلْ سُوءًا أَوْ يَظْلِمْ نَفْسَهُ ثُمَّ يَسْتَغْفِرِ اللَّـهَ يَجِدِ اللَّـهَ غَفُورًا رَّحِيمًا)\n[سورة النساء، آية: 110]',
            ),
            const CustomPraise(
              titel: 'سبحان الله وبحمده، سبحان الله العظيم',
            ),
            CustomNames(data: getData),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
