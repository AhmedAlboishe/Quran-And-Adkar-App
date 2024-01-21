import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran/services/adkar_service.dart';
import 'package:quran/ui/size_config.dart';
import 'package:quran/ui/widgets/custom_adkar.dart';

import 'package:quran/ui/widgets/total_adkar.dart';

class AllAdkarScreen extends StatefulWidget {
  const AllAdkarScreen({super.key});

  @override
  State<AllAdkarScreen> createState() => _AllAdkarScreenState();
}

class _AllAdkarScreenState extends State<AllAdkarScreen> {
  final AdkarServices adkarServices = AdkarServices();
  int totalAdkar = 0;
  getTotal() {
    totalAdkar = adkarServices.loadTotalAdkarFromStorage();
    setState(() {});
  }

  @override
  void initState() {
    getTotal();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: context.theme.colorScheme.onSecondary.withOpacity(0.1),
        title: Text(
          'الأذكار',
          style: TextStyle(
              fontSize: getProportionateScreenWidth(15),
              fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        children: [
          TotalAdkar(
            targetValue: totalAdkar,
          ),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              // mainAxisSize: MainAxisSize.min,
              children: [
                CustomAdkar(
                  title: 'أذكار الإستيقاظ',
                  onBack: getTotal,
                ),
                CustomAdkar(
                  title: 'أذكار الصباح',
                  onBack: getTotal,
                ),
                CustomAdkar(
                  title: 'أذكار المساء',
                  onBack: getTotal,
                ),
                CustomAdkar(
                  title: 'أذكار النوم',
                  onBack: getTotal,
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
