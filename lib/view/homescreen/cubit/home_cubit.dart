import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of<HomeCubit>(context);




  double sugar = 100;
  void patint(double value){
    sugar = value;
    emit(PatintState());
  }

  int waterbottel = 0;
  void AddWater(){
    waterbottel++;
    emit(AddWaterState());
  }
  void SubstractWater(){
    waterbottel--;
    emit(SubstractWaterState());
  }

  int sleep = 0;
  void AddSleep(){
    sleep++;
    emit(AddSleepState());
  }
  void Substractsleep(){
   sleep--;
    emit(SubstractSleepState());
  }

  int sport = 0;
  void AddSport(){
    sport++;
    emit(AddSportsState());
  }
  void Substractsport(){
    sport--;
    emit(SubstractSportsState());
  }

  double status = 100;
  void ChangeStatus (double value){
    status = value;
    emit(StatusState());
  }
  String? comment;
  void ChangeComment(String value){
     comment = value;
    if(status >= 70 && status <= 100){
       comment = "All under control";
    }else if (status >= 101 && status <= 130 ){
      comment = "Perfectoo";
    }else if (status >= 131 && status <= 180){
      comment = "Not low . not high . You did it !";
    }else if (status >= 181 && status <= 250){
      comment = "A bit high . did you take insulin?";
    }else if (status >= 251 && status <= 320){
      comment = "You are like a piece of sugar. This is not a compliment !";
    }else if (status >= 321 ){
      comment = "Blood sugar is up in the sky!";
    }
    emit(ChangeCommentState());
  }
}
