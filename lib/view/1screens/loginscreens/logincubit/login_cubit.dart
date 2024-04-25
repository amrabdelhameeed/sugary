import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());


  static LoginCubit get(context) => BlocProvider.of<LoginCubit>(context);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();


  String? validatorOfEmail(String? value){
    if ((value)!.isEmpty){
      return 'please , Enter Your Email';
    }else if( !RegExp(r'^[a-zA-Z0-9._%+-]+@gmail\.com$').hasMatch(value)){
      return "please , Enter Correct Email";
    }
    return null;
  }
  String? validatorOfPass(String? value){
    {
      if ((value)!.isEmpty){
        return 'please , Enter Your Password';
        ///   }else if (!RegExp(r'[A-Z]').hasMatch(value) ){return 'please , Enter One Character Capital AT Least';}else if (!RegExp(r'[0-9]').hasMatch(value)){return ' please , Enter One Number AT Least';}else if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)){return 'please , Enter One Special Character AT Least ';
      }else if ((value.length) < 8){
        return 'please , Password Must be 8 Character AT Least';
      }
      return null;
    }
  }


  bool obscure = true ;


  void Obscure(){
    obscure = !obscure;
    emit(loginobscure());
  }

  TextEditingController emaillogController = TextEditingController();
  TextEditingController passController = TextEditingController();


}
