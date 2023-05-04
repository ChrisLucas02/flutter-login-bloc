import 'package:code/login_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc1 extends Bloc<LoginEvent, LoginState> {
  final LoginRepository _repository;

  LoginBloc1({required LoginRepository repository})
      : _repository = repository,
        super(LoginState.initial()) {
    on<LoginRequested>((event, emit) {
      // New state: bloc -> ui
      emit(LoginState.loading());
      // Do logic (bloc -> data -> bloc)
      if (_repository.checkCredentials(event.username, event.password)) {
        // New state: bloc -> ui
        emit(LoginState.authenticated());
      } else {
        // New state: bloc -> ui
        emit(LoginState.error("Invalid credentials!"));
      }
    });
  }
}
