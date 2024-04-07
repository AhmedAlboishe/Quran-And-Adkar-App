import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../size_config.dart';
import '../controllers/quran_controller.dart';
import 'custom_span.dart';

class PagesWidget extends StatelessWidget {
  final int pageIndex;

  const PagesWidget({super.key, required this.pageIndex});

  @override
  Widget build(BuildContext context) {
    // sl<BookmarksTextController>().getBookmarksText();
    SizeConfig().init(context);
    return GetBuilder<QuranController>(builder: (quranCtrl) {
      if (context.isLandscape) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 0),
            child: Body(
              pageIndex: pageIndex,
              quranCtrl: quranCtrl,
            ),
          ),
        );
      } else {
        return Body(
          pageIndex: pageIndex,
          quranCtrl: quranCtrl,
        );
      }
    });
  }
}

class Body extends StatelessWidget {
  const Body({
    super.key,
    required this.pageIndex,
    required this.quranCtrl,
  });

  final int pageIndex;
  final QuranController quranCtrl;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        quranCtrl.clearSelection();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8.0),
        child: quranCtrl.pages.isEmpty
            ? const CircularProgressIndicator.adaptive()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  quranCtrl
                      .getCurrentPageAyahsSeparatedForBasmala(pageIndex)
                      .length,
                  (i) {
                    // int pageNumber = pageIndex + 1;

                    final ayahs = quranCtrl
                        .getCurrentPageAyahsSeparatedForBasmala(pageIndex)[i];
                    return Column(
                      children: [
                        // const Text('page90'),
                        // const Spacer(),
                        if (ayahs.first.ayahNumber == 1)
                          quranCtrl.surahBannerWidget(quranCtrl
                              .getSurahNumberByAyah(ayahs.first)
                              .toString()),
                        quranCtrl.getSurahNumberByAyah(ayahs.first) == 9 ||
                                quranCtrl.getSurahNumberByAyah(ayahs.first) == 1
                            ? const SizedBox.shrink()
                            : ayahs.first.ayahNumber == 1
                                ? (quranCtrl.getSurahNumberByAyah(
                                                ayahs.first) ==
                                            95 ||
                                        quranCtrl.getSurahNumberByAyah(
                                                ayahs.first) ==
                                            97)
                                    ? besmAllah2()
                                    : besmAllah()
                                : const SizedBox.shrink(),
                        Obx(
                          () {
                            return RichText(
                              // textScaler: const TextScaler.linear(1.05),
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: TextStyle(
                                  fontFamily: 'page${pageIndex + 1}',
                                  fontSize: getProportionateScreenWidth(
                                      context.isLandscape ? 20.0 : 20.0),
                                  height: 2,
                                  letterSpacing: 2,
                                  color: Get.theme.colorScheme.inversePrimary,
                                ),
                                children: List.generate(
                                  ayahs.length,
                                  (ayahIndex) {
                                    quranCtrl.isSelected =
                                        quranCtrl.selectedAyahIndexes.contains(
                                            ayahs[ayahIndex].ayahUQNumber);
                                    if (ayahIndex == 0) {
                                      return span(
                                          ayaaNumClr:
                                              context.theme.iconTheme.color!,
                                          textClr: context
                                              .theme.colorScheme.onBackground,
                                          isFirstAyah: true,
                                          text:
                                              //  ayahs[ayahIndex].codeV2,
                                              "${ayahs[ayahIndex].codeV2[0]}${ayahs[ayahIndex].codeV2.substring(1)}",
                                          pageIndex: pageIndex,
                                          isSelected: quranCtrl.isSelected,
                                          fontSize: getProportionateScreenWidth(
                                              context.isLandscape
                                                  ? 20.0
                                                  : 20.0),
                                          surahNum:
                                              quranCtrl.getSurahNumberFromPage(
                                                  pageIndex),
                                          ayahNum: ayahs[ayahIndex].ayahNumber,
                                          onLongPressStart:
                                              (LongPressStartDetails details) {
                                            quranCtrl.toggleAyahSelection(
                                                ayahs[ayahIndex].ayahUQNumber);
                                            // context.showAyahMenu(
                                            //     quranCtrl.getSurahNumberFromPage(
                                            //         pageIndex),
                                            //     ayahs[ayahIndex].ayahNumber,
                                            //     ayahs[ayahIndex].codeV2,
                                            //     pageIndex,
                                            //     ayahs[ayahIndex].text,
                                            //     ayahs[ayahIndex].ayahUQNumber,
                                            //     quranCtrl.getSurahNameFromPage(
                                            //         pageIndex),
                                            //     details: details);
                                          });
                                    }
                                    return span(
                                      ayaaNumClr:
                                          context.theme.iconTheme.color!,
                                      textClr: context
                                          .theme.colorScheme.onBackground,
                                      isFirstAyah: false,
                                      text: ayahs[ayahIndex].codeV2,
                                      pageIndex: pageIndex,
                                      isSelected: quranCtrl.isSelected,
                                      fontSize: getProportionateScreenWidth(
                                          context.isLandscape ? 20.0 : 20.0),
                                      surahNum: quranCtrl
                                          .getSurahNumberFromPage(pageIndex),
                                      ayahNum: ayahs[ayahIndex].ayahNumber,
                                      onLongPressStart:
                                          (LongPressStartDetails details) {
                                        quranCtrl.toggleAyahSelection(
                                            ayahs[ayahIndex].ayahUQNumber);
                                        // context.showAyahMenu(
                                        //     quranCtrl.getSurahNumberFromPage(
                                        //         pageIndex),
                                        //     ayahs[ayahIndex].ayahNumber,
                                        //     ayahs[ayahIndex].codeV2,
                                        //     pageIndex,
                                        //     ayahs[ayahIndex].text,
                                        //     ayahs[ayahIndex].ayahUQNumber,
                                        //     quranCtrl
                                        //         .getSurahNameFromPage(pageIndex),
                                        //     details: details);
                                      },
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                        // const Spacer(),
                        // Text(
                        //   pageNumber.toArabic(),
                        //   style: const TextStyle(
                        //     // fontSize: 20,
                        //     fontFamily: '',
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),
                      ],
                    );
                  },
                ),
              ),
      ),
    );
  }

  Widget? surahBannerLastPlace(int pageIndex, int i) {
    final ayhas =
        quranCtrl.getCurrentPageAyahsSeparatedForBasmala(pageIndex)[i];
    return pageIndex == quranCtrl.lastPlace
        ? quranCtrl.surahBannerWidget(
            (quranCtrl.getSurahNumberByAyah(ayhas.first) + 1).toString())
        : const SizedBox.shrink();
  }
}

typedef LongPressStartDetailsFunction = void Function(LongPressStartDetails)?;
