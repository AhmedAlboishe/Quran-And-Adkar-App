import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final int maxLine;
  final int? minLine;
  final String? fontFamily;
  final String? labelText;
  final bool autofocus;
  const CustomTextFormField({
    Key? key,
    this.controller,
    required this.maxLine,
    this.minLine,
    this.fontFamily,
    this.labelText,
    this.autofocus = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      padding: const EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
        color: context.theme.colorScheme.onSecondary.withOpacity(0.1),
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        border: Border.all(
          color: context.theme.iconTheme.color!,
        ),
      ),
      child: TextFormField(
        validator: (value) {
          if (autofocus) {
            if (value!.trim().isEmpty) {
              return 'يرجى إدخال نص';
            }
          } else {
            if (value!.isEmpty ||
                !RegExp(r'^[0-9]+$').hasMatch(value) ||
                double.parse(value) < 1) {
              return 'يرجى إدخال عدد صحيح';
            } else if (value.length > 4) {
              return 'يرجى إدخال أقل من 5 أرقام';
            }
          }
          return null;
        },
        controller: controller,
        maxLines: maxLine,
        minLines: minLine,
        autofocus: autofocus,
        keyboardType:
            autofocus ? TextInputType.multiline : TextInputType.number,
        // maxLength: autofocus ? null : 4,

        style: TextStyle(fontFamily: fontFamily), //'Parastoo'),
        decoration: const InputDecoration(
            disabledBorder: InputBorder.none, // border(context),
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            // labelText: labelText,
            errorStyle: TextStyle(color: Colors.red),
            contentPadding: EdgeInsets.symmetric(horizontal: 5)),
      ),
    );
  }
}
