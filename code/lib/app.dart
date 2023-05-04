import 'package:code/login/bloc-possibility-2/login_bloc.dart';
import 'package:code/login/login_view_1.dart';
import 'package:code/login/login_view_2.dart';
import 'package:code/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlutterLoginApp extends StatelessWidget {
  const FlutterLoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: Colors.cyan,
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          title: const Text('Flutter login'),
          centerTitle: true,
        ),
        body: BlocProvider(
          create: (context) => LoginBloc2(
            repository: context.read<LoginRepository>(),
          ),
          //child: const LoginView1(),
          child: const LoginView2(),
        ),
      ),
    );
  }
}
