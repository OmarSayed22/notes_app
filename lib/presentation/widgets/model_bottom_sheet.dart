import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/presentation/manager/note_cubit.dart';

import 'add_note_form.dart';

class ModelBottomSheet extends StatelessWidget {
  const ModelBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: BlocConsumer<NoteCubit, NoteState>(
        listener: (context, state) {
          if (state is AddNoteFailureState) {
            print(state.errorMessage);
          }
        },
        builder: (context, state) {
          if (state is! AddNoteLoadingState) {
            return const AddNoteForm();
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
