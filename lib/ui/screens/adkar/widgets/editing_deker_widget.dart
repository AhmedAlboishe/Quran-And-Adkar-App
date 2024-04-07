import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/adkar_model.dart';
import '../controller/adkar_controller.dart';

class EditingDekerWidget extends StatelessWidget {
  const EditingDekerWidget({
    super.key,
    required this.adkarController,
    required this.formKey,
    required this.dekerController,
    required this.repetitionController,
    required this.adkar,
    required this.dekerIndex,
  });

  final AdkarController adkarController;
  final GlobalKey<FormState> formKey;
  final TextEditingController dekerController;
  final TextEditingController repetitionController;
  final Adkar adkar;
  final int dekerIndex;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedCrossFade(
        // visible: adkarController.showEdit.value,
        crossFadeState: adkarController.showEdit.value
            ? CrossFadeState.showSecond
            : CrossFadeState.showFirst,
        duration: const Duration(milliseconds: 400),
        sizeCurve: standardEasing,
        secondCurve: standardEasing,
        firstCurve: standardEasing,
        firstChild: const SizedBox(
          width: double.infinity,
        ),
        secondChild: Row(
            children: List.generate(3, (index) {
          bool isEdite = index == 0;
          if (index == 0 || index == 2) {
            return Expanded(
              child: InkWell(
                // onTap: () {},
                onTap: isEdite
                    ? () => adkarController.onEditePresse(
                        formKey: formKey,
                        context: context,
                        dekerController: dekerController,
                        repetitionController: repetitionController,
                        id: adkar.id)
                    : () => adkarController.onDeletePresse(
                        deker: adkar, index: dekerIndex),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: context.theme.colorScheme.onSecondary,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(isEdite ? 'تعديل' : 'حذف'),
                      Icon(
                        isEdite ? Icons.edit : Icons.cancel_outlined,
                        color: isEdite
                            ? context.theme.colorScheme.onSecondary
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
    );
  }
}
