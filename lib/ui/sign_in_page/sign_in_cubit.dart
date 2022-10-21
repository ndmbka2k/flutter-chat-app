import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login_app/cubit/app_cubit.dart';
import 'package:flutter_login_app/models/enums/load_status.dart';
import 'package:flutter_login_app/repository/auth_repo.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final AuthRepo authRepo;
  final AppCubit appCubit;

  SignInCubit({
    required this.authRepo,
    required this.appCubit,
  }) : super(const SignInState());

  Future<UserCredential?> signInWithCredential(
    String email,
    String password,
  ) async {
    // final username = state.username ?? '';
    // final password = state.password ?? '';
    // if (username.isEmpty) {
    //   AppSnackbar.showError(message: 'Username is empty');
    //   return;
    // }
    // if (password.isEmpty) {
    //   AppSnackbar.showError(message: 'Password is empty');
    //   return;
    // }
    emit(state.copyWith(signInStatus: LoadStatus.loading));
    try {
      final UserCredential? result = await authRepo.signInWithCredential(email, password);
      if (result != null) {
        UserEntity? myProfile = await userRepo.getProfile();
        appCubit.updateProfile(myProfile);
        authRepo.saveToken(result);
        emit(state.copyWith(signInStatus: LoadStatus.success));
        Get.offNamed(RouteConfig.main);
      } else {
        emit(state.copyWith(signInStatus: LoadStatus.failure));
      }
    } catch (error) {
      logger.e(error);
      emit(state.copyWith(signInStatus: LoadStatus.failure));
    }
    return null;
  }
}
