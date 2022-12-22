import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/data/models/note_model.dart';
import 'package:notes_app/presentation/manager/bloc_observer.dart';
import 'package:notes_app/presentation/manager/note_cubit.dart';
import 'package:notes_app/presentation/pages/pages.dart';

import 'constants.dart';
import 'data/models/note_model.g.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.initFlutter();
  await Hive.openBox<NoteModel>(kNotesBox);
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteCubit()..fetchAllNotes(),
      child: MaterialApp(
          theme: ThemeData(
            brightness: Brightness.dark,
          ),
          home: const MyHomePage()),
    );
  }
}
