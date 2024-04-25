import 'package:flutter_bloc/flutter_bloc.dart';

import 'BMI.dart';
class BMICupit extends Cubit<BMIState>{
  BMICupit() : super(InitState());

 static BMICupit get(context) => BlocProvider.of<BMICupit>(context);
 bool male = true;
  double hight = 179;

  void ChangeGender (bool value) {
    male = value;
    emit(GenderState());
  }

  void ChangeHight (double value){
    hight = value;
    emit(HeightState());
  }
  int weight = 73;
  void AddWeight (){
    weight++;
    emit(AddWeightState());
  }

  void SubstractWeight (){
    weight--;
    emit(SubstractWeightState());
  }
  int Age = 20;
  void AddAge (){
    Age++;
    emit(AddAgeState());
  }

  void SubstractAge (){
    Age--;
    emit(SubstractAgeState());
  }
}