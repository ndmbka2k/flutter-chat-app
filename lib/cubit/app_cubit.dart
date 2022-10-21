import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login_app/models/enums/load_status.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState>{
  AppCubit(): super(const AppState());

  void updateProfile(UserCredential user) {
    emit(state.copyWith(user: user));
  }
  void signOut() async {
    emit(state.copyWith(signOutStatus: LoadStatus.loading));
    try {
      await FirebaseAuth.instance.signOut();
      emit(state.copyWith(signOutStatus: LoadStatus.success));
    } catch (e) {
      log('Sign out ERROR: $e');
      emit(state.copyWith(signOutStatus: LoadStatus.failure));
    }
  }
}