import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weight_tracker/Auth/presentaion/bloc/auth_bloc.dart';
import 'package:weight_tracker/Auth/presentaion/bloc/auth_event.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          BlocProvider.of<AuthBloc>(context).add(const SignIn());
        },
        child: const Text('Sign in'),
      )),
    );
  }
}
