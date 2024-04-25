import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sugar/view/homescreen/cubit/addnewemergency/Model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';
import 'DescState.dart';

class DescCubit extends Cubit<DescState>{
  DescCubit() : super(DescInitState());

  static DescCubit get(context) => BlocProvider.of(context);

  var numberController = TextEditingController();
  var nameController = TextEditingController();

List<NewEmergency> emergency=[];

void AddDesc(){
  emergency.add(NewEmergency(number:numberController.text,name:nameController.text));
  emit(AddSuccessState());
}

  String? validatorOfNumber(String? value){
    {
      if ((value)!.isEmpty){
        return 'please , Enter Your Number';
      }else if (!RegExp(r'[0-9]').hasMatch(value)){
        return ' please , Enter One Number AT Least';
      }else if ((value.length) < 11){
        return 'please , Password Must be 11 Character AT Least';
      }
      return null;
    }
  }
  String? validatorOfName(String? value){
    {
      if ((value)!.isEmpty){
        return 'please , Enter Phone Name';
      }
      return null;
    }
  }

}