import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc-possibility-3/login_bloc.dart';

class LoginView3 extends StatefulWidget {
  const LoginView3({super.key});

  @override
  State<LoginView3> createState() => _LoginView3State();
}

class _LoginView3State extends State<LoginView3> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc3, LoginState>(listener: (context, state) {
      if (state.isAuthenticated) {
        print("Well done!");
      } else if (state.errorMessage.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(state.errorMessage)),
        );
      }
      _passwordController.clear();
      _usernameController.clear();
    }, builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Dispatch LoginRequested event with entered credentials
                context.read<LoginBloc3>().add(
                      LoginRequested(
                        username: _usernameController.text,
                        password: _passwordController.text,
                      ),
                    );
              },
              child: state.isLoading
                  ? const CircularProgressIndicator()
                  : const Text('Login'),
            ),
          ],
        ),
      );
    });
  }
}
