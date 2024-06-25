import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:sugar/core/models/personal_details_model.dart';
import 'package:sugar/core/models/question_model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
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
      emit(ProfileError(e.message ?? "Error in profile"));
    }
  }

  Future deleteProfile() async {
    emit(ProfileLoading());
    try {
      await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).delete();
      await FirebaseAuth.instance.currentUser!.delete();
      emit(ProfileDeleteSuccess());
    } on FirebaseException catch (e) {
      emit(ProfileError(e.message ?? "Error in delete profile"));
    }
  }

  Future signOut() async {
    emit(ProfileLoading());
    await FirebaseAuth.instance.signOut();
    emit(ProfileSignOut());
  }

  Future<void> fetchProfileDetails() async {
    try {
      emit(ProfileLoading());
      DocumentSnapshot userDoc = await _firestore.collection('users').doc(_auth.currentUser!.uid).get();
      personalDetailsModel = PersonalDetailsModel.fromJson(userDoc['personalDetails']);
      emit(ProfileLoaded(personalDetailsModel!));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<void> updateName(String name) async {
    try {
      emit(ProfileLoading());
      await _auth.currentUser!.updateDisplayName(name);

      await fetchProfileDetails();
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<void> updateGender(bool isMale) async {
    try {
      emit(ProfileLoading());
      personalDetailsModel = personalDetailsModel!.copyWith(isMale: isMale);
      await _firestore.collection('users').doc(_auth.currentUser!.uid).update({
        'personalDetails': personalDetailsModel!.toJson(),
      });
      emit(ProfileLoaded(personalDetailsModel!));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<void> updateAge(int age) async {
    try {
      emit(ProfileLoading());
      personalDetailsModel = personalDetailsModel!.copyWith(age: age);
      await _firestore.collection('users').doc(_auth.currentUser!.uid).update({
        'personalDetails': personalDetailsModel!.toJson(),
      });
      emit(ProfileLoaded(personalDetailsModel!));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<void> updateHeight(double height) async {
    try {
      emit(ProfileLoading());
      personalDetailsModel = personalDetailsModel!.copyWith(height: height);
      await _firestore.collection('users').doc(_auth.currentUser!.uid).update({
        'personalDetails': personalDetailsModel!.toJson(),
      });
      emit(ProfileLoaded(personalDetailsModel!));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<void> updateWeight(double weight) async {
    try {
      emit(ProfileLoading());
      personalDetailsModel = personalDetailsModel!.copyWith(weight: weight);
      await _firestore.collection('users').doc(_auth.currentUser!.uid).update({
        'personalDetails': personalDetailsModel!.toJson(),
      });
      emit(ProfileLoaded(personalDetailsModel!));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<String> _uploadImageAndGetURL(XFile image) async {
    try {
      File file = File(image.path);
      String uid = FirebaseAuth.instance.currentUser!.uid;
      final ref = FirebaseStorage.instance.ref().child('profilePictures/$uid');
      final uploadTask = ref.putFile(file);
      final snapshot = await uploadTask;
      return await snapshot.ref.getDownloadURL();
    } catch (e) {
      print('Error uploading image: $e');
      return "https://www.vhv.rs/dpng/d/505-5058560_person-placeholder-image-free-hd-png-download.png";
    }
  }

  Future<void> updatePhotoURL(XFile file) async {
    try {
      emit(ProfileLoading());
      final image = await _uploadImageAndGetURL(file);
      await _auth.currentUser!.updatePhotoURL(image);
      emit(ProfileLoaded(personalDetailsModel!));
      // await fetchProfileDetails();
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }
}
