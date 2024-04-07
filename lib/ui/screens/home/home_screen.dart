import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:quran/ui/screens/home/widgets/aya_widget.dart';
import 'package:quran/ui/screens/home/widgets/custom_container.dart';
import 'package:quran/ui/screens/home/widgets/custom_details.dart';
import 'package:quran/ui/screens/home/widgets/custom_names.dart';
import 'package:quran/ui/screens/home/widgets/short_deker.dart';
import 'package:quran/ui/screens/quran/controllers/quran_controller.dart';
import 'package:quran/ui/size_config.dart';

import '../../../core/model/data_model.dart';
import '../../../services/notification_services.dart';
import 'widgets/custom_praise.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  final DataModel dataModel = DataModel();
  late final String duaa;
  late final String tasbih;
  late final String ayaa;
  late final Map names;
  final random = Random();
  final QuranController quranController = Get.find();
  @override
  void initState() {
    // NotifyHelper().initializationNotification();
    // NotifyHelper().requestIOSPermissions();
    duaa = dataModel.getDuaa();
    tasbih = dataModel.getTasbih();
    ayaa = dataModel.getAyaa();
    names = dataModel.getNames();
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
            // const Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       CustomCategory(
            //         title: 'أذكار الصباح',
            //         asset: 'assets/images/sunrise.jpg',
            //       ),
            //       SizedBox(
            //         width: 15,
            //       ),
            //       CustomCategory(
            //         title: 'أذكار المساء',
            //         asset: 'assets/images/sunset.jpg',
            //       ),
            //     ],
            //   ),
            // ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Row(
                children: [
                  ShortDeker(
                    title: 'أذكار الصباح',
                    assets: 'assets/images/prayer.png',
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  ShortDeker(
                    title: 'أذكار المساء',
                    assets: 'assets/images/prayer2.png',
                  ),
                ],
              ),
            ),
            // CustomContainer(
            //   title: 'دعاء',
            //   subTitle: duaa,
            // ),
            const AyaWidget(
                subTitle:
                    'هُوَ ٱلَّذِي جَعَلَ لَكُمُ ٱلۡأَرۡضَ ذَلُولٗا فَٱمۡشُواْ فِي مَنَاكِبِهَا وَكُلُواْ مِن رِّزۡقِهِۦۖ وَإِلَيۡهِ ٱلنُّشُورُ ١٥ ',
                ayaInfo: 'سورة المُلك، أية 15'),

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
