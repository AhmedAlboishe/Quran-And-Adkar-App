import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quran/model/data_model.dart';
import 'package:quran/ui/size_config.dart';
import 'package:quran/ui/widgets/custom_container.dart';
import 'package:quran/ui/widgets/custom_category.dart';
import 'package:quran/ui/widgets/custom_praise.dart';
import 'package:quran/ui/widgets/custom_details.dart';
import 'package:quran/ui/widgets/custom_names.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  final DataModel dataModel = DataModel();
  late final String getData;
  late final String duaa;
  late final String tasbih;
  late final String ayaa;
  late final Map names;
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
    duaa = dataModel.getDuaa();
    tasbih = dataModel.getTasbih();
    ayaa = dataModel.getAyaa();
    names=dataModel.getNames();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'تـدبَّـر',
          style: TextStyle(
              fontSize: getProportionateScreenWidth(15),
              fontWeight: FontWeight.w700),
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
            CustomContainer(
              title: 'آية من القرآن',
              subTitle: ayaa,
              fontFamily: 'Amiri',
              fontSize: getProportionateScreenWidth(14),
              textHight: 2,
            ),
            DateTime.now().weekday == 5
                ? const CustomContainer(
                    title: 'يوم الجمعة',
                    subTitle:
                        'من قرأ سورةَ الكهفِ في يومِ الجمعةِ ، أضاء له من النورِ ما بين الجمُعتَينِ',
                  )
                : const SizedBox.shrink(),
            CustomPraise(
              titel: tasbih,
            ),
             CustomNames(data: names),
            CustomContainer(
              title: 'دعاء',
              subTitle: duaa,
            ),
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
