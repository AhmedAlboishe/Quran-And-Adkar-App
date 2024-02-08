import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:quran/helper/dialog_helper.dart';
import 'package:quran/model/adkar_model.dart';
import 'package:quran/services/data_client.dart';
import 'package:vibration/vibration.dart';

class CustomDeker extends StatefulWidget {
  const CustomDeker({
    super.key,
    required this.onDisappear,
    required this.onTapCount,
    this.edit = false,
    required this.onEditeDone,
    required this.adkar,
  });
  // final Map data;
  final Adkar adkar;
  final Function onDisappear;
  final Function onTapCount;
  final Function onEditeDone;
  final bool edit;
  @override
  State<CustomDeker> createState() => _CustomDekerState();
}

class _CustomDekerState extends State<CustomDeker>
    with AutomaticKeepAliveClientMixin {
  int count = -1;
  late int repetition;
  late String deker;
  TextEditingController dekerController = TextEditingController();
  TextEditingController repetitionController = TextEditingController();
  final DataClient _dataClient = DataClient();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future onUpdate() async {
    var data = await _dataClient.query(
        tableName: 'adkar', where: ' id = "${widget.adkar.id}"');
    dekerController.text = deker = data[0].deker;
    repetition = data[0].repetition;
    widget.onEditeDone();
    setState(() {});
  }

  @override
  void initState() {
    dekerController.text = deker = widget.adkar.deker;
    repetition = widget.adkar.repetition;
    repetitionController.text = repetition.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return AnimationConfiguration.staggeredList(
      position: 0,
      child: SlideAnimation(
        duration: const Duration(milliseconds: 2000),
        curve: Curves.fastLinearToSlowEaseIn,
        child: FadeInAnimation(
          curve: Curves.fastLinearToSlowEaseIn,
          duration: const Duration(milliseconds: 2500),
          child: AnimatedSize(
            duration: const Duration(milliseconds: 1200),
            curve: Curves.easeOutExpo,
            child: count < repetition - 1
                ? Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                    child: PhysicalModel(
                      color: context.theme.colorScheme.background,
                      // shadowColor: Get.isDarkMode
                      //     ? const Color.fromARGB(255, 100, 100, 100)
                      //     : const Color(0xFF000000),
                      shadowColor: context.theme.colorScheme.onSecondary
                          .withOpacity(0.5),
                      elevation: 4,
                      borderRadius: BorderRadius.circular(15),
                      child: GestureDetector(
                        onTap: () {
                          Vibration.vibrate(duration: 30);
                          widget.onTapCount();
                          setState(() {
                            count++;
                          });
                          if (count >= repetition - 1) {
                            widget.onDisappear();
                            log('onDisappear');
                          }
                        },
                        child: Container(
                          // height: 80,
                          padding: const EdgeInsets.only(
                              right: 15, left: 15, bottom: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: Get.isDarkMode
                                  ? Colors.white24
                                  : Colors.black26,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                deker,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    height: 1.8, fontFamily: 'Parastoo'),
                              ),
                              repetition < 7
                                  ? Row(
                                      children:
                                          List.generate(repetition, (index) {
                                        return Expanded(
                                          child: AnimatedContainer(
                                            curve: Curves
                                                .fastLinearToSlowEaseIn, //fastOutSlowIn,
                                            duration: const Duration(
                                                milliseconds: 800),
                                            margin: EdgeInsets.only(
                                                left: repetition <= 3 ? 8 : 5,
                                                right: repetition <= 3 ? 8 : 5,
                                                top: 20,
                                                bottom: 15),
                                            height: 10,
                                            decoration: BoxDecoration(
                                              color: count >= index
                                                  ? context.theme.colorScheme
                                                      .onSecondary
                                                  : context.theme.colorScheme
                                                      .onSecondary
                                                      .withOpacity(0.3),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                          ),
                                        );
                                      }),
                                    )
                                  : Container(
                                      margin: const EdgeInsets.only(
                                          top: 10, bottom: 10),
                                      padding: const EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                          bottom: 1,
                                          top: 3),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        border: Border.all(
                                          color: context
                                              .theme.colorScheme.onSecondary,
                                        ),
                                      ),
                                      child: Text(
                                        'التكرار: ${count == -1 ? repetition : count == 0 ? repetition - 1 : repetition - count - 1}',
                                        style: const TextStyle(
                                            fontFamily: 'Tajawal'),
                                      )),
                              Visibility(
                                visible: widget.edit,
                                child: Row(
                                    children: List.generate(3, (index) {
                                  bool isEdite = index == 0;
                                  if (index == 0 || index == 2) {
                                    return Expanded(
                                      child: InkWell(
                                        onTap: isEdite
                                            ? _onEditePresse
                                            : _onDeletePresse,
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 13),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            border: Border.all(
                                              color: context.theme.colorScheme
                                                  .onSecondary,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(isEdite ? 'تعديل' : 'حذف'),
                                              Icon(
                                                isEdite
                                                    ? Icons.edit
                                                    : Icons.cancel_outlined,
                                                color: isEdite
                                                    ? context.theme.colorScheme
                                                        .onSecondary
                                                    : Colors.red,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  } else {
                                    return const SizedBox(
                                      width: 10,
                                    );
                                  }
                                })),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ),
      ),
    );
  }

  _onEditePresse() {
    DialogHelper.dialog(
        title: 'تعديل الذِكِر',
        formKey: formKey,
        context: context,
        dekerController: dekerController,
        repetitionController: repetitionController,
        onSaved: () async {
          if (formKey.currentState!.validate()) {
            int response = await _dataClient.update(
                tableName: 'adkar',
                values: {
                  'deker': dekerController.text,
                  'repetition': int.parse(repetitionController.text)
                },
                whereId: widget.adkar.id);
            print('$response ***-------------');
            await onUpdate();
            Get.back();
            Fluttertoast.showToast(
                msg: 'تم تعديل الذِكِر',
                backgroundColor: const Color(0xFF616161));
          }
        },
        onCancel: () async {
          widget.onEditeDone();
          Get.back();
          dekerController.text = deker;
          repetitionController.text = repetition.toString();
        });
  }

  _onDeletePresse() {
    Get.dialog(Dialog(
      child: Container(
        padding:
            const EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('هل ترغب في حذف الذِكِر؟'),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () async {
                    int response =
                        await _dataClient.delete('adkar', widget.adkar.id);
                    print('delete -->$response');
                    widget.onDisappear();
                    count = repetition - 1;
                    Get.back();
                    widget.onEditeDone();
                    Fluttertoast.showToast(
                        msg: 'تم حذف الذِكِر',
                        backgroundColor: const Color(0xFF616161));
                  },
                  child: const Text(
                    'حذف',
                  ),
                ),
                TextButton(
                  onPressed: () {
                    widget.onEditeDone();
                    Get.back();
                  },
                  child: Text(
                    'إلغاء',
                    style: TextStyle(
                      color: Colors.red.withOpacity(0.9),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }

  @override
  bool get wantKeepAlive => true;
}
