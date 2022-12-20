import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/data/models/note_model.dart';
import 'package:notes_app/presentation/manager/note_cubit.dart';

import 'custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    Key? key,
  }) : super(key: key);

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String? title, subTitle;

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
                ElevatedButton(
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.resolveWith(
                          (s) => const Size.fromHeight(50)),
                      shape: MaterialStateProperty.resolveWith((s) =>
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      backgroundColor: MaterialStateProperty.resolveWith(
                          (s) => const Color(0xff53ebd6)),
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        NoteModel note = NoteModel(
                            title: title!,
                            subTitle: subTitle!,
                            date: DateTime.now(),
                            color: 1);
                        context.read<NoteCubit>().addNote(note);
                      } else {
                        autoValidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    },
                    child: const Text(
                      'Add',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
