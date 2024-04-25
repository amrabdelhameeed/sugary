part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class PatintState extends HomeState {}

final class AddWaterState extends HomeState {}

final class SubstractWaterState extends HomeState {}

final class AddSleepState extends HomeState {}

final class SubstractSleepState extends HomeState {}

final class AddSportsState extends HomeState {}

final class SubstractSportsState extends HomeState {}

final class StatusState extends HomeState {}

final class ChangeCommentState extends HomeState {}
