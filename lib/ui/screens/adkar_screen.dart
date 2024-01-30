import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:quran/helper/dialog_helper.dart';
import 'package:quran/services/adkar_service.dart';
import 'package:quran/services/data_client.dart';
import 'package:quran/services/theme_services.dart';
import 'package:quran/ui/size_config.dart';
import 'package:quran/ui/widgets/custom_counter.dart';

import 'package:quran/ui/widgets/custom_deker.dart';
import 'package:quran/ui/widgets/custom_exit_button.dart';

class AdkarScreen extends StatefulWidget {
  const AdkarScreen({super.key, required this.title});
  final String title;
  @override
  State<AdkarScreen> createState() => _AdkarScreenState();
}

class _AdkarScreenState extends State<AdkarScreen>
    with AutomaticKeepAliveClientMixin {
  // List in
  List<dynamic> adkar = [];
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  int count = 0;
  final adkarServices = AdkarServices();
  bool disposes = false;
  int disappearedCount = 0;
  bool showExit = false;
  int totalAdkar = 0;
  bool edit = false;
  final DataClient _dataClient = DataClient();
  TextEditingController dekerController = TextEditingController();
  TextEditingController repetitionController = TextEditingController();

  final List title = const [
    'إضافة',
    'تعديل',
    'حذف',
  ];
  void _countOnTap() {
    count++;
    adkarServices.saveAdkarNumberToStorage(totalAdkar: count + totalAdkar);
    setState(() {});
  }

  getData() async {
    adkar.addAll(await _dataClient.query(
        tableName: 'adkar', where: 'category = "${widget.title}"'));

    setState(() {});
  }

  onEditeDone() {
    edit = false;

    setState(() {});
  }

  @override
  void initState() {
    totalAdkar = adkarServices.loadTotalAdkarFromStorage();
    getData();
    super.initState();
  }

  void _onDekerDisappear() {
    // log('_onDekerDisappear $disappearedCount');
    disappearedCount++;
    if (disappearedCount == adkar.length) {
      // تنفيذ الكود الذي تريده عند اختفاء جميع العناصر
      // _showOverlayMessage("تم اختفاء جميع العناصر");
      totalAdkar = adkarServices.loadTotalAdkarFromStorage();
      setState(() {});
      Future.delayed(const Duration(milliseconds: 1200), () {
        if (mounted) {
          setState(() {
            showExit = true;
          });
        }
      });
    }
  }

  bool isDarkMode = Get.isDarkMode;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    // SizeConfig().init;
    return PopScope(
      canPop: showExit || adkar.isEmpty || count == 0,
      onPopInvoked: (didPop) {
        // log('$showExit ---- ${count == 0}\n${showExit || count == 0}');

        // log('pop scope $didPop');
        totalAdkar = adkarServices.loadTotalAdkarFromStorage();
        setState(() {
          disposes = true;
        });
        Future.delayed(const Duration(milliseconds: 1200), () {
          if (mounted) {
            setState(() {
              showExit = true;
            });
          }
        });
        // log('disposes $disposes');
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _appBar(),
        body: PageStorage(
            bucket: PageStorageBucket(),
            child: adkar.isEmpty
                ? const Center(
                    child: Text(
                      'لاتوجد أذكار\nقم بإضافة أذكار الآن',
                      textAlign: TextAlign.center,
                    ),
                  )
                : disappearedCount != adkar.length && disposes == false
                    ? AnimationLimiter(
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: adkar.length,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return CustomDeker(
                                data: adkar[index],
                                onTapCount: _countOnTap,
                                onDisappear: _onDekerDisappear,
                                edit: edit,
                                onEditeDone: onEditeDone,
                              );
                            }),
                      )
                    : Column(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          CustomCounter(
                            title: 'عدد الأذكار التي قرأتها',
                            targetValue: count,
                          ),
                          CustomCounter(
                            title: 'مجموع الأذكار          ',
                            targetValue: totalAdkar,
                          ),
                          const Spacer(),
                          Visibility(
                            visible: showExit,
                            child: const CustomExitButton(),
                          ),
                          const Spacer(),
                        ],
                      )),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Text(
        widget.title,
        style: TextStyle(fontSize: getProportionateScreenWidth(15)),
      ),
      actions: [
        Visibility(
          visible: disappearedCount != adkar.length && disposes == false,
          child: IconButton(
              onPressed: () {
                edit = true;
                setState(() {});
              },
              icon: const Icon(Icons.edit)),
        ),

        Visibility(
          visible: disappearedCount != adkar.length && disposes == false ||
              adkar.isEmpty,
          child: IconButton(
              onPressed: () {
                edit = false;
                setState(() {});
                DialogHelper.dialog(
                  dekerController: dekerController,
                  repetitionController: repetitionController,
                  context: context,
                  title: 'إضافة ذِكِر',
                  formKey: formKey,
                  onCancel: () {
                    Get.back();
                    dekerController.text = '';
                    repetitionController.text = '';
                  },
                  onSaved: _onDekerAdd,
                );
              },
              icon: const Icon(Icons.add)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: IconButton(
              onPressed: () {
                ThemeServices().switchThemeMode();
                setState(() {
                  isDarkMode = !isDarkMode;
                });
              },
              icon: Icon(isDarkMode
                  ? CupertinoIcons.sun_max
                  : Icons.dark_mode_outlined)),
        ),
        // Visibility(
        //   visible: disappearedCount != adkar.length && disposes == false ||
        //       adkar.isEmpty,
        //   child: Padding(
        //     padding: const EdgeInsets.only(left: 5.0),
        //     child: PopupMenuButton(
        //       icon: const Icon(
        //         CupertinoIcons.ellipsis_vertical,
        //         // color: context.theme.colorScheme.onSecondary,
        //       ),
        //       tooltip: 'القائمة',
        //       itemBuilder: (context) {
        //         return List.generate(3, (index) {
        //           return PopupMenuItem(
        //             onTap: () {
        //               edit = false;
        //               delete = false;
        //               setState(() {});
        //               if (index == 0) {
        //               } else if (index == 1) {
        //                 edit = true;
        //                 delete = false;
        //                 setState(() {});
        //               } else {
        //                 delete = true;
        //                 edit = false;
        //                 setState(() {});
        //               }
        //             },
        //             child: Row(
        //               mainAxisAlignment: MainAxisAlignment.end,
        //               children: [
        //                 Text(
        //                   title[index],
        //                   // textAlign: TextAlign.right,
        //                   // textDirection: TextDirection.rtl,
        //                   style: const TextStyle(
        //                       // fontFamily: 'Tajawal',
        //                       ),
        //                 ),
        //                 const SizedBox(
        //                   width: 50,
        //                 ),
        //                 const Spacer(),
        //                 Icon(
        //                   index == 0
        //                       ? Icons.add
        //                       : index == 1
        //                           ? Icons.edit
        //                           : Icons.cancel_outlined,
        //                   color: context.theme.colorScheme.onSecondary,
        //                 ),
        //               ],
        //             ),
        //           );
        //         });
        //       },
        //     ),
        //   ),
        // ),
      ],
    );
  }

  _onDekerAdd() async {
    if (formKey.currentState!.validate()) {
      int response = await _dataClient.insert('adkar', {
        'category': widget.title,
        'deker': dekerController.text,
        'repetition': int.parse(repetitionController.text),
      });
      print('insert --->$response');

      adkar.addAll(
          await _dataClient.query(tableName: 'adkar', where: 'id = $response'));
      setState(() {});
      if (response != 0) {
        Fluttertoast.showToast(
            msg: 'تم إضافة الذِكِر', backgroundColor: const Color(0xFF616161));
      }
      Get.back();
      dekerController.text = '';
      repetitionController.text = '';
    }
  }

  @override
  bool get wantKeepAlive => true;
}
