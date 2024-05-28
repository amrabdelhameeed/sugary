import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'ques_state.dart';

class QuesCubit extends Cubit<QuesState> {
  QuesCubit() : super(QuesInitial());

  static QuesCubit get(context) => BlocProvider.of<QuesCubit>(context);

List answers = [];
}
