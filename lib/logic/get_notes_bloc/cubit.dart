import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/logic/get_notes_bloc/state.dart';

class GetNoteCubit extends Cubit<GetNoteStates> {
  GetNoteCubit() : super(GetNoteInitialState());

  Future getNote() async {
    emit(GetNoteLoadingState());
    try {
      await FirebaseFirestore.instance.collection("notes").get;
      emit(GetNoteSuccessState());
    } catch (e) {
      emit(GetNoteErrorState(e.toString()));
    }
  }
}
