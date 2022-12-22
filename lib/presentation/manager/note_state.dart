part of 'note_cubit.dart';

abstract class NoteState {}

class NoteInitial extends NoteState {}

class AddNoteLoadingState extends NoteState {}

class AddNoteSuccessState extends NoteState {}

class AddNoteFailureState extends NoteState {
  String errorMessage;

  AddNoteFailureState(
    this.errorMessage,
  );
}

class NoteSuccessState extends NoteState {
  List<NoteModel> notes;

  NoteSuccessState(this.notes);
}

class NoteFailureState extends NoteState {
  String errorMessage;

  NoteFailureState(
    this.errorMessage,
  );
}

class UpdateNoteSuccessState extends NoteState {}
