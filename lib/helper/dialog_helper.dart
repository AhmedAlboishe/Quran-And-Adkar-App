import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran/ui/widgets/custom_text_form_field.dart';

class DialogHelper {
  static dialog({
    required BuildContext context,
    dekerController,
    repetitionController,
    onSaved,
    onCancel,
    required String title,
    required GlobalKey<FormState> formKey,
  }) {
    Get.dialog(
      Dialog(
        insetPadding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: formKey,
            child: Container(
              padding: const EdgeInsets.only(
                  top: 10, right: 20, left: 20, bottom: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    controller: dekerController,
                    maxLine: 5,
                    minLine: 4,
                    autofocus: true,
                    fontFamily: 'Parastoo',
                    labelText: 'النص',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 200,
                    height: 80,
                    child: CustomTextFormField(
                      controller: repetitionController,
                      maxLine: 1,
                      labelText: 'التكرار',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: onSaved,
                        child: const Text(
                          'حفظ',
                        ),
                      ),
                      TextButton(
                        onPressed: onCancel,
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
          ),
        ),
      ),
      barrierDismissible: false,
      // useSafeArea: false,
    );
  }
}
