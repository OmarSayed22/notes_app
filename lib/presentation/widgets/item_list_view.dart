import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/data/models/note_model.dart';
import 'package:notes_app/presentation/manager/note_cubit.dart';

import '../pages/edit_note_page.dart';

Widget itemsListView() {
  return BlocBuilder<NoteCubit, NoteState>(builder: (context, state) {
    List<NoteModel>? notes = context.read<NoteCubit>().notes;
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 16),
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: notes!.length,
        itemBuilder: (context, index) {
          return _buildNoteItem(context, notes[index], index);
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 10,
          );
        },
      ),
    );
  });
}

Widget _buildNoteItem(context, NoteModel note, index) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return EditNotePage(note, index);
      }));
    },
    child: Container(
        padding: const EdgeInsets.all(32),
        decoration: ShapeDecoration(
            color: Color(note.color),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16))),
        height: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      note.title,
                      style: const TextStyle(
                          overflow: TextOverflow.clip,
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    note.subTitle,
                    style: const TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      note.delete();
                      BlocProvider.of<NoteCubit>(context).fetchAllNotes();
                    },
                    icon: const Icon(
                      Icons.delete,
                      size: 40,
                      color: Colors.black,
                    )),
                Text(
                  DateFormat('yyyy / mm / dd').format(note.date),
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ],
            )
          ],
        )),
  );
}
