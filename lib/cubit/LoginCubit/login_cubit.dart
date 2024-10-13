import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  login({required String email, required String password}) async {
    try {
      emit(LoginLoading());
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailure(e.code.toString()));
      } else if (e.code == 'wrong-password') {
        emit(LoginFailure(e.code.toString()));
      } else {
        emit(LoginFailure(e.code.toString()));
      }
    }
  }
}
