// eye_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:sugar/core/network/api_services.dart';

part 'models_state.dart';

class ModelsCubit extends Cubit<ModelsState> {
  ModelsCubit() : super(ModelsInitial());

  void fetchEyeModel(String imageBase64) async {
    emit(ModelsLoading());
    try {
      final response = await ApiServices.fetchEyeModel(imageBase64);
      emit(ModelsLoaded(response.data));
    } catch (error) {
      emit(const ModelsError("Failed to analyze EyeModel."));
    }
  }

  void fetchFoodModel(String imageBase64) async {
    emit(ModelsLoading());
    try {
      final response = await ApiServices.fetchFoodModel(imageBase64);
      emit(ModelsLoaded(response.data));
    } catch (error) {
      emit(const ModelsError("Failed to analyze FoodModel."));
    }
  }

  void fetchSugarModel(double glucoseLevel) async {
    emit(ModelsLoading());
    try {
      final response = await ApiServices.fetchSugarModel(glucoseLevel);
      emit(ModelsLoaded(response.data));
    } catch (error) {
      emit(const ModelsError("Failed to analyze SugarModel."));
    }
  }
}
