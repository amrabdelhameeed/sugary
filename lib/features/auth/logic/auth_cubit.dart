import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of<AuthCubit>(context);

  Future createUserWithEmailAndPassword({required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(AuthLoginSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        emit(AuthLoginError(error: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        emit(AuthLoginError(error: 'The account already exists for that email.'));
      }
    } catch (e) {
      emit(AuthLoginError(error: e.toString()));
    }
  }

  void updateDisplayName({
    required String name,
  }) async {
    try {
      await FirebaseAuth.instance.currentUser!.updateDisplayName(name);
      emit(UpdateDisplayName());
    } on FirebaseAuthException catch (e) {
      emit(AuthLoginError(error: e.message ?? "Error In Updating Display Name"));
    } catch (e) {
      emit(AuthLoginError(error: e.toString()));
    }
  }

  void signInWithEmailAndPassword({required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      emit(AuthLoginSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        emit(AuthLoginError(error: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(AuthLoginError(error: 'Wrong password provided for that user.'));
        print('Wrong password provided for that user.');
      }
    }
  }
}
