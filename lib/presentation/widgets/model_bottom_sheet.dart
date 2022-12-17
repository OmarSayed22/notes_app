import 'package:flutter/material.dart';
import 'package:notes_app/presentation/widgets/custom_text_field.dart';

Widget modalBottomSheet() {

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: const [
          SizedBox(height: 30),
          CustomTextField(
              hintText: 'Title',
              hintTextColor:  Color(0xff53ebd6),
              borderColor: Colors.white,
              maxLines: 1),SizedBox(height: 16,),
          CustomTextField(
              hintText: 'Content',
              hintTextColor:  Color(0xff53ebd6),
              borderColor: Colors.white,
              maxLines: 5),
        ],
      ),
    );
  }
