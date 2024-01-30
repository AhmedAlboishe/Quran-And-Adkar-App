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
    return TextFormField(
      validator: (value) {
        if (autofocus) {
          if (value!.trim().isEmpty) {
            return 'يرجى إدخال نص';
          } else {
            return null;
          }
        } else {
          if (value!.isEmpty ||
              !RegExp(r'^[0-9]+$').hasMatch(value) ||
              int.parse(value) < 1 ||
              value.length > 4) {
            return 'يرجى إدخال عدد صحيح';
          } else {
            return null;
          }
        }
      },
      controller: controller,
      maxLines: maxLine,
      minLines: minLine,
      autofocus: autofocus,
      keyboardType: autofocus ? TextInputType.multiline : TextInputType.number,
      maxLength: autofocus ? null : 4,
      style: TextStyle(fontFamily: fontFamily), //'Parastoo'),
      decoration: InputDecoration(
          disabledBorder: border(context),
          border: border(context),
          enabledBorder: border(context),
          errorBorder: errorBorder(context),
          focusedErrorBorder: errorBorder(context),
          labelText: labelText,
          errorStyle: const TextStyle(color: Colors.red),
          contentPadding: EdgeInsets.symmetric(
              vertical: autofocus ? 15 : 0, horizontal: 5)),
    );
  }

  OutlineInputBorder border(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(15)),
      borderSide: BorderSide(color: context.theme.colorScheme.onSecondary),
    );
  }

  OutlineInputBorder errorBorder(BuildContext context) {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      borderSide: BorderSide(color: Colors.red),
    );
  }
}
