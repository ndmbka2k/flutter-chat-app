part of 'sign_in_cubit.dart';

class SignInState extends Equatable {
  final LoadStatus signInStatus;

  const SignInState({
    this.signInStatus = LoadStatus.initial,
  });

  @override
  List<Object?> get props => [
    signInStatus,
  ];

  SignInState copyWith({
    LoadStatus? signInStatus,
  }) {
    return SignInState(
      signInStatus: signInStatus ?? this.signInStatus,
    );
  }
}