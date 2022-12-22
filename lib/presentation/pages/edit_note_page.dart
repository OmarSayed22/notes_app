import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:notes_app/presentation/manager/note_cubit.dart';

import '../../data/models/note_model.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_text_field.dart';

class EditNotePage extends StatefulWidget {
  EditNotePage(this.note, this.index, {super.key});

  NoteModel note;
  int index;

  @override
  State<EditNotePage> createState() => _EditNotePageState();
}

class _EditNotePageState extends State<EditNotePage> {
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  String? title, subTitle;

  GlobalKey<FormState> formKey = GlobalKey();

  Color pickerColor = Color(0xff443a49);

  Color currentColor = Color(0xff443a49);

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
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                NoteModel updatedNote = NoteModel(
                  title: title!,
                  subTitle: subTitle!,
                  date: widget.note.date,
                  color: currentColor.value,
                );
                context
                    .read<NoteCubit>()
                    .updateNotes(widget.index, updatedNote);

                Navigator.pop(context);
              } else {
                autoValidateMode = AutovalidateMode.always;
              }
            }),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: buildForm(widget.note, widget.index),
      ),
    );
  }

  Form buildForm(NoteModel note, int index) {
    void changeColor(Color color) => setState(() => pickerColor = color);
    return Form(
      autovalidateMode: autoValidateMode,
      key: formKey,
      child: Column(
        children: [
          const SizedBox(height: 30),
          CustomTextField(
              controller: TextEditingController(text: note.title),
              onSaved: (value) => title = value,
              hintTextColor: const Color(0xff53ebd6),
              borderColor: Colors.white,
              maxLines: 1),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
              controller: TextEditingController(text: note.subTitle),
              onSaved: (value) => subTitle = value,
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
        ],
      ),
    );
  }
}
