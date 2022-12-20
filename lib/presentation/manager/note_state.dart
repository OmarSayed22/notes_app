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
