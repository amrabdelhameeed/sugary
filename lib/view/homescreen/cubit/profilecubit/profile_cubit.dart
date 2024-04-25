import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  static ProfileCubit get(context) => BlocProvider.of(context);


  final ImagePicker picker = ImagePicker();
  XFile? picture;
  List<XFile> images =[];
  void AddPicture()async{
    emit(AddLoadingState());
    picture = await picker.pickImage(source: ImageSource.gallery);
    emit(AddSuccessState());
  }

















}
