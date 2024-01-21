import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran/ui/screens/adkar_screen.dart';
import 'package:quran/ui/size_config.dart';

class CustomAdkar extends StatefulWidget {
  const CustomAdkar({
    super.key,
    required this.title,
    required this.onBack,
  });

  final String title;
  final Function onBack;
  @override
  State<CustomAdkar> createState() => _CustomAdkarState();
}

class _CustomAdkarState extends State<CustomAdkar>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
      child: InkWell(
        onTap: () async {
          await Get.to(
            () => AdkarScreen(title: widget.title),
            transition: Transition.fade,
          );
          widget.onBack();
        },
        borderRadius: BorderRadius.circular(15),
        child: Container(
          height: getProportionateScreenWidth(75),
          decoration: BoxDecoration(
            color: context.theme.colorScheme.background,
            boxShadow: [
              BoxShadow(
                color: Get.isDarkMode
                    ? const Color(0x2F646464)
                    : const Color(0x29000000),
                offset: const Offset(1, 4),
                blurRadius: 5,
              )
            ],
            border: Border.all(
              color: context.theme.colorScheme.onSecondary.withOpacity(0.5),
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                widget.title,
                style: TextStyle(fontSize: getProportionateScreenWidth(13)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
//            painter: MyWavePainter(),

class WavePainter extends CustomPainter {
  final BuildContext context;

  WavePainter({super.repaint, required this.context});
  @override
  void paint(
    Canvas canvas,
    Size size,
  ) {
    var paint = Paint()
      ..color = context.theme.colorScheme.background
      ..style = PaintingStyle.fill;
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 5, size.height - 60, size.width / 2, size.height - 25);
    path.quadraticBezierTo(
        3 * size.width / 4, size.height, size.width, size.height - 30);
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
