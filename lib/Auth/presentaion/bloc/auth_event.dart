import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
  @override
  List<Object> get props => [];
}

class SignIn extends AuthEvent {
  const SignIn();
}

class SignOut extends AuthEvent {
  const SignOut();
}
