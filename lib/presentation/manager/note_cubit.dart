import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/data/models/note_model.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());
  List<NoteModel>? notes;
  var box = Hive.box<NoteModel>(kNotesBox);

  void addNote(NoteModel note) async {
    emit(AddNoteLoadingState());
    try {
      await box.add(note);
      Future.delayed(const Duration(milliseconds: 1000), () {
        emit(AddNoteSuccessState());
      });
    } catch (e) {
      emit(AddNoteFailureState(e.toString()));
    }
  }

  void fetchAllNotes() async {
    try {
      notes = box.values.toList();
      emit(NoteSuccessState(notes!));
    } catch (e) {
      emit(NoteFailureState(e.toString()));
    }
  }

  void updateNotes(int index, NoteModel note) async {
    box.putAt(index, note);
    emit(UpdateNoteSuccessState());
    fetchAllNotes();
  }
}
