import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:sugar/core/models/personal_details_model.dart';
import 'package:sugar/core/models/question_model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  PersonalDetailsModel? personalDetailsModel;
  List<QuestionModel>? questions;

  Future getUserData() async {
    emit(ProfileLoading());
    try {
      final doc = await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).get();
      personalDetailsModel = PersonalDetailsModel.fromJson(doc.data()!['personalDetails']);
      questions = List.from(doc.data()!['questions']).map((e) => QuestionModel.fromJson(e)).toList();
      if (kDebugMode) {
        print(doc.data()!['personalDetails']);
        print(List.from(doc.data()!['questions']).map((e) => QuestionModel.fromJson(e)).toList().first.answers);
      }
      emit(ProfileSuccess());
    } on FirebaseException catch (e) {
      emit(ProfileError(error: e.message ?? "Error in profile"));
    }
  }

  Future deleteProfile() async {
    emit(ProfileLoading());
    try {
      await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).delete();
      await FirebaseAuth.instance.currentUser!.delete();
      emit(ProfileDeleteSuccess());
    } on FirebaseException catch (e) {
      emit(ProfileError(error: e.message ?? "Error in delete profile"));
    }
  }

  Future signOut() async {
    emit(ProfileLoading());
    await FirebaseAuth.instance.signOut();
    emit(ProfileSignOut());
  }
}
