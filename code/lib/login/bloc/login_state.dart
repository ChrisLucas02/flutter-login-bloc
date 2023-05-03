part of 'login_bloc.dart';

class LoginState {
  final bool isLoading;
  final bool isAuthenticated;
  final String errorMessage;

  LoginState({
    required this.isAuthenticated,
    required this.isLoading,
    this.errorMessage = '',
  });

  factory LoginState.initial() {
    return LoginState(
      isAuthenticated: false,
      isLoading: false,
    );
  }

  factory LoginState.loading() {
    return LoginState(
      isAuthenticated: false,
      isLoading: true,
    );
  }

  factory LoginState.authenticated() {
    return LoginState(
      isAuthenticated: true,
      isLoading: false,
    );
  }

  factory LoginState.error(String errorMessage) {
    return LoginState(
      isAuthenticated: false,
      isLoading: false,
      errorMessage: errorMessage,
    );
  }
}
