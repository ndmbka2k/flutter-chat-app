
part of 'app_cubit.dart';

class AppState extends Equatable{
  final UserCredential? user;
  final LoadStatus? signOutStatus;

  const AppState({
    this.user,
    this.signOutStatus,
});


  AppState copyWith({
    UserCredential? user,
    LoadStatus? signOutStatus,
  }) {
    return AppState(
      user: user ?? this.user,
      signOutStatus: signOutStatus ?? this.signOutStatus,
    );
  }

  @override
  List<Object?> get props => [
    user,
  ];

}