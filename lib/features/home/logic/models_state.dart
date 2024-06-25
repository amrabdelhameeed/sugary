part of 'models_cubit.dart';

abstract class ModelsState {
  const ModelsState();
}

class ModelsInitial extends ModelsState {}

class ModelsLoading extends ModelsState {}

class ModelsLoaded extends ModelsState {
  final dynamic data;
  const ModelsLoaded(this.data);
}

class ModelsError extends ModelsState {
  final String message;
  const ModelsError(this.message);
}
