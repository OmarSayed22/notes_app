import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/custom_text_field.dart';

class EditNotePage extends StatelessWidget {
  const EditNotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: CustomAppBar(
            title: 'Edit',
            icon: const Icon(
              Icons.edit,
              size: 32,
              color: Colors.white,
            ),
            onPressedIcon: () {
              Navigator.pop(context);
            }),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: EditNote(),
      ),
    );
  }
}

class EditNote extends StatefulWidget {
  const EditNote({
    Key? key,
  }) : super(key: key);

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String? title, subTitle;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autoValidateMode,
      key: formKey,
      child: Column(
        children: [
          const SizedBox(height: 30),
          CustomTextField(
              onSaved: (value) => title = value,
              hintText: 'Title',
              hintTextColor: const Color(0xff53ebd6),
              borderColor: Colors.white,
              maxLines: 1),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextField(
                    onSaved: (value) => subTitle = value,
                    hintText: 'Content',
                    hintTextColor: const Color(0xff53ebd6),
                    borderColor: Colors.white,
                    maxLines: 5),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
