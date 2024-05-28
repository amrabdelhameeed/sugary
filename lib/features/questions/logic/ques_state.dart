part of 'ques_cubit.dart';

@immutable
sealed class QuesState {}

final class QuesInitial extends QuesState {}

final class ChangeIndexState extends QuesState {}
