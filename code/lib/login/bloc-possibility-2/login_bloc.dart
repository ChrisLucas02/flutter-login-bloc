import 'package:code/login_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc2 extends Bloc<LoginEvent, LoginState> {
  final LoginRepository _repository;
  LoginBloc2({required LoginRepository repository})
      : _repository = repository,
        super(const LoginState()) {
    on<LoginRequested>((event, emit) {
      // New state: bloc -> ui
      emit(state.copyWith(
        status: LoginStatus.loading,
      ));
      // Do logic (bloc -> data -> bloc)
      if (_repository.checkCredentials(event.username, event.password)) {
        // New state: bloc -> ui
        emit(state.copyWith(
          status: LoginStatus.authenticated,
        ));
      } else {
        // New state: bloc -> ui
        emit(state.copyWith(
          status: LoginStatus.error,
          error: "Invalid credentials!",
        ));
      }
    });
  }
}
