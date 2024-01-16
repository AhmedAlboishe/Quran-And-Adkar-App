import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomNames extends StatelessWidget {
  const CustomNames({
    super.key,
    required this.data,
  });
  final String data;
  @override
  Widget build(BuildContext context) {
    String name = data.split(':')[0];
    String meaning = data.split(':')[1];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: PhysicalModel(
        color: context.theme.colorScheme.background,
        shadowColor: Get.isDarkMode
            ? const Color.fromARGB(255, 100, 100, 100)
            : const Color(0xFF000000),
        elevation: 4,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          // height: 150,
          padding: const EdgeInsets.only(right: 10, left: 10, bottom: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Get.isDarkMode ? Colors.white24 : Colors.black26,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text('أسماء الله الحسنى'),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.copy,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.share_rounded,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Transform.scale(
                scale: 4,
                child: Text(
                  name,
                  // textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily:
                        Get.isDarkMode ? 'Tashkeel-white' : 'Tashkeel-black',
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                meaning,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
