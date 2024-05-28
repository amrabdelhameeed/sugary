import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:sugar/core/shared_cubits/cubit/profile_cubit.dart';
import 'package:sugar/features/auth/logic/auth_cubit.dart';

final getIt = GetIt.instance;
void initDI() {
  getIt.registerFactory<AuthCubit>(() => AuthCubit());
  getIt.registerFactory<ProfileCubit>(() => ProfileCubit());
}

final authCubit = getIt<AuthCubit>();
final profileCubit = getIt<ProfileCubit>();
