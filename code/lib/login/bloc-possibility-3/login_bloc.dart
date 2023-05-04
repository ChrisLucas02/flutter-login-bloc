import 'package:code/login_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc3 extends Bloc<LoginEvent, LoginState> {
  final LoginRepository _repository;
  LoginBloc3({required LoginRepository repository})
      : _repository = repository,
        super(const LoginInitial()) {
    on<LoginRequested>((event, emit) {
      // New state: bloc -> ui
      emit(const LoginLoading());
      // Do logic (bloc -> data -> bloc)
      if (_repository.checkCredentials(event.username, event.password)) {
        // New state: bloc -> ui
        emit(const LoginAuthenticated());
      } else {
        // New state: bloc -> ui
        emit(const LoginError('Invalid Credentials!'));
      }
    });
  }
}
