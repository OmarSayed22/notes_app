import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final Color hintTextColor;
  final Color borderColor;
  final int? maxLines;

  CustomTextField(
      {super.key,
      this.onSaved,
      required this.hintText,
      required this.hintTextColor,
      required this.borderColor,
      @required this.maxLines});

  void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return 'This field is required';
          }
        },
        onSaved: onSaved,
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
