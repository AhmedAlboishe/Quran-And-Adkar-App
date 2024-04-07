import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quran/ui/screens/home/widgets/button.dart';
import 'package:share_plus/share_plus.dart';

class ButtonsBar extends StatelessWidget {
  const ButtonsBar({
    super.key,
    required this.subTitle,
  });

  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Button(
          title: 'نسخ',
          asset: 'assets/icons/clipboard.png',
          onTap: () {
            Clipboard.setData(ClipboardData(text: subTitle));
            Fluttertoast.showToast(
                msg: 'تم النسخ', backgroundColor: const Color(0xFF616161));
          },
        ),
        const SizedBox(
          width: 10,
          // child: VerticalDivider(
          //     // color: Colors.amber,
          //     ),
        ),
        Button(
            title: 'مشاركة',
            onTap: () {
              Share.share(subTitle);
            },
            asset: 'assets/icons/share-2.png')
      ],
    );
  }
}
