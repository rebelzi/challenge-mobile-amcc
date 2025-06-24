import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AuthBloc() : super(AuthInitial()) {
    on<LoginRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );

        emit(LoginAuthAuthenticated(userCredential.user!));
      }
      catch (e) {
        emit(AuthError("Login Gagal :" + e.toString()));
        emit(UnAuthAuthenticated());
      }
    });

    on<RegisterRequested>((event, emit) async {
      
      emit(AuthLoading());
      try {
        UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );

        emit(RegisterAuthAuthenticated(userCredential.user!));
      }
      catch (e) {
        emit(AuthError("Register Gagal :" + e.toString()));
        emit(UnAuthAuthenticated());
      }
    });

    on<LogoutRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        await _auth.signOut();
        emit(UnAuthAuthenticated());
      } catch (e) {
        emit(AuthError("Logout Gagal :" + e.toString()));
      }
    });
  }
}


