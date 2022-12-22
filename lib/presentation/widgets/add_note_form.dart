import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
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
  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);

  @override
  Widget build(BuildContext context) {
    void changeColor(Color color) => setState(() => pickerColor = color);
    return Form(
      autovalidateMode: autoValidateMode,
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 30),
          CustomTextField(
              onSaved: (value) => title = value,
              hintText: 'Title',
              hintTextColor: const Color(0xff53ebd6),
              borderColor: Colors.white,
              maxLines: 2),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
              onSaved: (value) => subTitle = value,
              hintText: 'Content',
              hintTextColor: const Color(0xff53ebd6),
              borderColor: Colors.white,
              maxLines: 5),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Select a color!'),
                        content: SingleChildScrollView(
                          child: BlockPicker(
                              pickerColor: pickerColor,
                              onColorChanged: changeColor),
                        ),
                        actions: <Widget>[
                          ElevatedButton(
                            child: const Text('Got it'),
                            onPressed: () {
                              setState(() => currentColor = pickerColor);
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 10,
                    height: 50,
                    color: currentColor,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Note Color',
                          style: TextStyle(fontSize: 24, color: Colors.red),
                        ),
                        Text(
                          'Select a color!',
                          style: TextStyle(fontSize: 16, color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
          const SizedBox(
            height: 100,
          ),
          BlocConsumer<NoteCubit, NoteState>(
            listener: (context, state) {
              if (state is AddNoteSuccessState) {
                Navigator.pop(context);
              }
              if (state is AddNoteFailureState) {
                print('Error : ${state.errorMessage}');
              }
            },
            builder: (context, state) {
              return ElevatedButton(
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
                          color: currentColor.value);
                      context.read<NoteCubit>().addNote(note);
                      context.read<NoteCubit>().fetchAllNotes();
                    } else {
                      autoValidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                  child: state is AddNoteLoadingState
                      ? const SizedBox(
                          width: 32,
                          height: 32,
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.grey,
                            color: Colors.black26,
                          ))
                      : const Text(
                          'Add',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ));
            },
          ),
          const SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }
}
