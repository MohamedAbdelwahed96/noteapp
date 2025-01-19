import 'package:firebase_auth/firebase_auth.dart';
import 'package:noteapp/logic/sign_up_bloc/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  final FirebaseAuth firebaseAuth;

  SignUpCubit(this.firebaseAuth) : super(SignUpInitialState());

  Future signUp(String e, p) async {
    emit(SignUpLoadingState());
    try {
      await firebaseAuth.createUserWithEmailAndPassword(email: e, password: p);
      emit(SignUpSuccessState());
    } catch (e) {
      emit(SignUpErrorState(e.toString()));
    }
  }
}
