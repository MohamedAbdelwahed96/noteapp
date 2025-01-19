import 'package:firebase_auth/firebase_auth.dart';
import 'package:noteapp/logic/sign_in_bloc/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInCubit extends Cubit<SignInStates> {
  final FirebaseAuth firebaseAuth;

  SignInCubit(this.firebaseAuth) : super(SignInInitialState());

  Future SignIn(String e, p) async {
    emit(SignInLoadingState());
    try {
      await firebaseAuth.signInWithEmailAndPassword(email: e, password: p);
      emit(SignInSuccessState());
    } catch (e) {
      emit(SignInErrorState(e.toString()));
    }
  }
}
