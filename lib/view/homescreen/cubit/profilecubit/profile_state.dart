part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class AddLoadingState extends ProfileState {}

final class AddSuccessState extends ProfileState {}
