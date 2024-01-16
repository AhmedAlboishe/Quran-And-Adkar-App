import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran/ui/screens/adkar_screen.dart';
import 'package:quran/ui/size_config.dart';

class CustomCategory extends StatefulWidget {
  const CustomCategory({
    super.key,
    required this.title,
    required this.asset,
  });
  final String title, asset;

  @override
  State<CustomCategory> createState() => _CustomCategoryState();
}

class _CustomCategoryState extends State<CustomCategory>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    super.build(context);
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Get.to(() => AdkarScreen(title: widget.title));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: PhysicalModel(
            color: context.theme.colorScheme.background,
            shadowColor: Get.isDarkMode
                ? const Color.fromARGB(255, 100, 100, 100)
                : const Color(0xFF000000),
            elevation: 4,
            borderRadius: BorderRadius.circular(15),
            child: Container(
              height: getProportionateScreenWidth(65),
              // padding: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Stack(
                alignment: Alignment.center,
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Opacity(
                      opacity: 0.7,
                      child: Image.asset(
                        widget.asset,
                        fit: BoxFit.fill,
                        // opacity: ,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      widget.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: getProportionateScreenWidth(13),
                        color: Colors.white,
                        shadows: const [BoxShadow(offset: Offset(0, 1))],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
