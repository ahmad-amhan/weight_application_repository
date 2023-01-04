import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weight_tracker/Auth/domain/usecases/auth_usecase.dart';
import 'package:weight_tracker/Auth/presentaion/bloc/auth_event.dart';
import 'package:weight_tracker/Auth/presentaion/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUseCase authUseCase;
  AuthBloc(this.authUseCase) : super(InitialState()) {
    on<SignIn>((event, emit) async {
      emit(AuthLoading());
      try {
        await authUseCase.signIn();
        emit(Authenticated());
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });
    on<SignOut>((event, emit) async {
      emit(AuthLoading());
      try {
        await authUseCase.signOut();
        emit(UnAuthenticated());
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });
  }
}
