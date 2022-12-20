import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/data/models/note_model.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());

  void addNote(NoteModel note) async {
    emit(AddNoteLoadingState());
    try {
      var box = Hive.box<NoteModel>(kNotesBox);
      await box.add(note);
      emit(AddNoteSuccessState());
    } catch (e) {
      emit(AddNoteFailureState(e.toString()));
    }
  }
}
