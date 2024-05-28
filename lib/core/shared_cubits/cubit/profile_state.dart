part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileSuccess extends ProfileState {}

final class ProfileSignOut extends ProfileState {}

final class ProfileDeleteSuccess extends ProfileState {}

final class ProfileError extends ProfileState {
  final String error;

  ProfileError({required this.error});
}
