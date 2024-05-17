// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:quran/core/helper/arabic_number.dart';
// import 'package:quran/ui/screens/quran/widgets/pages.dart';

// import 'models/ayaat_model.dart';
// import '../../size_config.dart';
// import 'controllers/quran_controller.dart';

// class QuranScreen extends StatefulWidget {
//   const QuranScreen({super.key, required this.page, required this.name});
//   final int page;
//   final String name;
//   @override
//   State<QuranScreen> createState() => _QuranScreenState();
// }

// class _QuranScreenState extends State<QuranScreen>
//     with TickerProviderStateMixin {
//   PageController controller = PageController();
//   // List surahs = [];
//   // List<Ayah> ayaat = [];
//   final List suras = const [
//     'ﭑ',
//     'ﭒ',
//     'ﭓ',
//     'ﭔ',
//     'ﭕ',
//     'ﭖ',
//     'ﭗ',
//     'ﭘ',
//     'ﭙ',
//     'ﭚ',
//     'ﭛ',
//     'ﭜ',
//     'ﭝ',
//     'ﭞ',
//     'ﭟ',
//     'ﭠ',
//     'ﭡ',
//     'ﭢ',
//     'ﭣ',
//     'ﭤ',
//     'ﭥ',
//     'ﭦ',
//     'ﭧ',
//     'ﭨ',
//     'ﭩ',
//     'ﭪ',
//     'ﭫ',
//     'ﭬ',
//     'ﭭ',
//     'ﭮ',
//     'ﭯ',
//     'ﭰ',
//     'ﭱ',
//     'ﭲ',
//     'ﭳ',
//     'ﭴ',
//     'ﭵ',
//     'ﭶ',
//     'ﭷ',
//     'ﭸ',
//     'ﭹ',
//     'ﭺ',
//     'ﭻ',
//     'ﭼ',
//     'ﭽ',
//     'ﭾ',
//     'ﭿ',
//     'ﮀ',
//     'ﮁ',
//     'ﮂ',
//     'ﮃ',
//     'ﮄ',
//     'ﮅ',
//     'ﮆ',
//     'ﮇ',
//     'ﮈ',
//     'ﮉ',
//     'ﮊ',
//     'ﮋ',
//     'ﮌ',
//     'ﮍ',
//     'ﮎ',
//     'ﮏ',
//     'ﮐ',
//     'ﮑ',
//     'ﮒ',
//     'ﮓ',
//     'ﮔ',
//     'ﮕ',
//     'ﮖ',
//     'ﮗ',
//     'ﮘ',
//     'ﮙ',
//     'ﮚ',
//     'ﮛ',
//     'ﮜ',
//     'ﮝ',
//     'ﮞ',
//     'ﮟ',
//     'ﮠ',
//     'ﮡ',
//     'ﮢ',
//     'ﮣ',
//     'ﮤ',
//     'ﮥ',
//     'ﮦ',
//     'ﮧ',
//     'ﮨ',
//     'ﮩ',
//     'ﮪ',
//     'ﮫ',
//     'ﮬ',
//     'ﮭ',
//     'ﮮ',
//     'ﮯ',
//     'ﮰ',
//     'ﮱ',
//     'ﯓ',
//     'ﯔ',
//     'ﯕ',
//     'ﯖ',
//     'ﯗ',
//     'ﯘ',
//     'ﯙ',
//     'ﯚ',
//     'ﯛ',
//     'ﯜ',
//     'ﯝ',
//     'ﯞ',
//     'ﯟ',
//     'ﯠ',
//     'ﯡ',
//     'ﯢ',
//     'ﯣ',
//   ];

//   int page = 125;
//   // List<Ayah> page = [];
//   late AnimationController animationController;
//   late PageController pageController = PageController(initialPage: widget.page);
//   final QuranController quranCtrl = Get.put(QuranController());
//   // final List<LongPressGestureRecognizer> _longPressGestureRecognizers = [];
//   // List<bool> isSelected = [];
//   List<Ayah> ayahs = [];
//   int surahNumber = 0;
//   getData() async {
//     await quranCtrl.loadQuran();
//     setState(() {});
//   }

//   @override
//   void initState() {
//     // getData();
//     animationController = AnimationController(
//         vsync: this, duration: const Duration(milliseconds: 200));
//     // pageController.addListener(onPageChanged);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     return Scaffold(
//       body:
      
//        PageView.builder(
//         // shrinkWrap: true,
//         controller: pageController,
//         physics: const ClampingScrollPhysics(),

//         itemCount: 604,
//         itemBuilder: (context, pageNumber) {
//           // surahNumber = quranCtrl.getSurahNumberByAyah(ayahs[0]);
//           // return PagesWidget(pageIndex: pageNumber);
//           final page = pageNumber + 1;
//           return Padding(
//             padding: const EdgeInsets.symmetric(vertical: 50),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 // TopTitleWidget(index: index, isRight: true),
//                 //      Gap(size.height * .04),
//                 // const Spacer(
//                 //   flex: 2,
//                 // ),
//                 Padding(
//                   padding: const EdgeInsets.only(right: 10, left: 20),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       SvgPicture.asset(
//                         'assets/svg/juz/${quranCtrl.pages[pageNumber].first.juz}.svg',
//                         height: 35,
//                         colorFilter: ColorFilter.mode(
//                             context.theme.colorScheme.onBackground,
//                             BlendMode.srcIn),
//                       )
//                       // Text(
//                       //   'الجزء:f ${quranCtrl.pages[pageNumber].first.juz}',
//                       //   // textScaler: const TextScaler.linear(2),
//                       //   style: TextStyle(
//                       //     fontSize: context.isPortrait ? 18.0 : 22.0,
//                       //     fontFamily: '',
//                       //   ),
//                       // ),
//                       ,
//                       Text(
//                         suras[quranCtrl.getSurahNameFromPage(pageNumber) - 1],
//                         // textScaler: const TextScaler.linear(2),
//                         style: TextStyle(
//                           fontSize: context.isPortrait ? 20.0 : 22.0,
//                           fontFamily: 'SuraNames',
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const Spacer(
//                   flex: 2,
//                 ),

//                 PagesWidget(pageIndex: pageNumber),
//                 // Gap(size.height * .04),
//                 const Spacer(
//                   flex: 2,
//                 ),
//                 Center(
//                   child: Text(
//                     page.toArabic(),
//                     // textScaler: const TextScaler.linear(2),
//                     style: TextStyle(
//                         fontSize: context.isPortrait ? 18.0 : 22.0,
//                         fontFamily: '',
//                         color: const Color(0xff77554B)),
//                   ),
//                 ),
//               ],
//             ),
//           );

//           // GetX<QuranController>(builder: (controller) {
//           //   // ayahs = controller.getAyahsForCurrentPage(pageNumber + 1);
//           //   // print(controller.getSurahNumberByAyah(ayahs[0]));
//           //   return buildPages(pageNumber: pageNumber + 1);
//           // });
//         },
//       ),

//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           pageController.jumpToPage(page++);
//         },
//       ),
//       // : const Text('loading'),
//     );
//   }

//   Widget buildPages({required int pageNumber}) {
//     // print('$pageNumber ---${quranCtrl.getAyahsForCurrentPage(pageNumber)}');+

//     print('$surahNumber');
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Center(
//           child: SingleChildScrollView(
//             physics: const BouncingScrollPhysics(),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(vertical: 15),
//               child: RichText(
//                 text: TextSpan(
//                   children: List.generate(
//                     ayahs.length,
//                     (index) {
//                       return TextSpan(
//                         text: index == 0
//                             ? '${ayahs[index].codeV2[0]} ${ayahs[index].codeV2.substring(1)}'
//                             : ayahs[index].codeV2,
//                         style: TextStyle(
//                           fontSize: getProportionateScreenWidth(22),
//                           fontFamily: 'page$pageNumber',
//                           // backgroundColor: isSelected[index]
//                           //     ? const Color.fromARGB(95, 233, 30, 98)
//                           //     : null,
//                           color: Colors.black,
//                           height: 1.9,
//                           // letterSpacing: 1.5,
//                           // wordSpacing: 1.5,
//                         ),
//                         // recognizer: _longPressGestureRecognizers[index],
//                       );
//                     },
//                   ),
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           ),
//         ),
//         // const Spacer(),
//         Text(
//           pageNumber.toArabic(),
//           style: const TextStyle(fontWeight: FontWeight.bold),
//         ),
//       ],
//     );
//   }
// }
