part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  final bool isLoading;
  final bool isAuthenticated;
  final String errorMessage;

  const LoginState(
    this.isAuthenticated,
    this.isLoading,
    this.errorMessage,
  );

  @override
  List<Object> get props => [
        isLoading,
        isAuthenticated,
        errorMessage,
      ];
}

class LoginInitial extends LoginState {
  const LoginInitial() : super(false, false, '');
}

class LoginAuthenticated extends LoginState {
  const LoginAuthenticated() : super(true, false, '');
}

class LoginLoading extends LoginState {
  const LoginLoading() : super(false, true, '');
}

class LoginError extends LoginState {
  const LoginError(String error) : super(false, false, error);
}
