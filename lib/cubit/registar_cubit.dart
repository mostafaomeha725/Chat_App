import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'registar_state.dart';

class RegistarCubit extends Cubit<RegistarState> {
  RegistarCubit() : super(RegistarInitial());
  registar({required String email, required String password}) async {
    try {
      emit(RegistarLoading());
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(RegistarSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegistarFailure(e.code.toString()));
      } else if (e.code == 'email-already-in-use') {
        emit(RegistarFailure(e.code.toString()));
      } else {
        emit(RegistarFailure(e.code.toString()));
      }
    }
  }
}
