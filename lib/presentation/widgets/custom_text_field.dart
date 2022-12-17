import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final Color hintTextColor;
  final Color borderColor;
  final int? maxLines;

  const CustomTextField(
      {super.key,
      required this.hintText,
      required this.hintTextColor,
      required this.borderColor,
      @required this.maxLines});

  @override
  Widget build(BuildContext context) {
    return TextField(
        textAlignVertical: TextAlignVertical.center,
        maxLines: maxLines,
        decoration: InputDecoration(
            alignLabelWithHint: true,
            hintText: hintText,
            hintStyle: TextStyle(color: hintTextColor),
            focusedBorder: outlineInputBorder(),
            enabledBorder: outlineInputBorder(),
            border: outlineInputBorder()));
  }

  OutlineInputBorder outlineInputBorder() {
    return OutlineInputBorder(
        borderSide: BorderSide(color: borderColor),
        borderRadius: const BorderRadius.all(Radius.circular(16)));
  }
}
