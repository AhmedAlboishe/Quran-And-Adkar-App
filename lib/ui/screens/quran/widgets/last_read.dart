import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_library/quran.dart';

import '../../../size_config.dart';
import '../controllers/last_read_services.dart';
import '../quran_screen.dart';

class LastRead extends StatelessWidget {
  const LastRead({super.key});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        Get.to(() => const QuranScreen());
        Future.delayed(const Duration(milliseconds: 10), () {
          QuranLibrary().jumpToPage(QuranLibrary().quranCtrl.lastPage);
        });
      },
      child: Container(
        height: 150,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: context.theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: context.theme.iconTheme.color!,
          ),
          boxShadow: [
            BoxShadow(
              color: Get.isDarkMode
                  ? const Color(0x2F646464)
                  : const Color(0x29000000),
              offset: const Offset(0, 2),
              blurRadius: 5,
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'أخــر قــــراءة',
              style: TextStyle(
                fontSize: getProportionateScreenWidth(15),
                fontWeight: FontWeight.w700,
              ),
            ),
            GetX(
              init: LastReadService(),
              builder: (controller) => Center(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        QuranLibrary()
                            .getCurrentSurahDataByPageNumber(
                                pageNumber: controller.lastPageRead.value)
                            .arabicName,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(18),
                        ),
                      ),
                      Column(
                        children: [
                          const Icon(
                            Icons.bookmark_added_outlined,
                            size: 50,
                          ),
                          Text(
                            'صفحة ${controller.lastPageRead.value}',
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(15),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
