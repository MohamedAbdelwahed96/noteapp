import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:noteapp/data/note_model.dart';
import 'package:noteapp/logic/create_note_bloc/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateNoteCubit extends Cubit<CreateNoteStates> {
  CreateNoteCubit() : super(CreateNoteInitialState());

  Future createNote(NoteModel note) async {
    emit(CreateNoteLoadingState());
    try {
      await FirebaseFirestore.instance.collection("notes").add(note.toMap());
      emit(CreateNoteSuccessState());
    } catch (e) {
      emit(CreateNoteErrorState(e.toString()));
    }
  }
}
