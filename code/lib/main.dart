import 'package:code/app.dart';
import 'package:code/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(RepositoryProvider.value(
    value: LoginRepository(),
    child: const FlutterLoginApp(),
  ));
}
