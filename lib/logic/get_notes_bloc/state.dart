class GetNoteStates {}

class GetNoteInitialState extends GetNoteStates {}

class GetNoteLoadingState extends GetNoteStates {}

class GetNoteSuccessState extends GetNoteStates {}

class GetNoteErrorState extends GetNoteStates {
  final String em;
  GetNoteErrorState(this.em);
}