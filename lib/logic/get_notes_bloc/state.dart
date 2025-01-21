import 'package:noteapp/data/note_model.dart';

class GetNoteStates {}

class GetNoteInitialState extends GetNoteStates {}

class GetNoteLoadingState extends GetNoteStates {}

class GetNoteSuccessState extends GetNoteStates {
  List <NoteModel> note;
  GetNoteSuccessState(this.note);
}

class GetNoteErrorState extends GetNoteStates {
  final String em;
  GetNoteErrorState(this.em);
}