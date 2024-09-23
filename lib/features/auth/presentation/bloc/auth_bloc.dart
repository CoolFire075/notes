import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/auth_interactor.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required AuthInteractor authInteractor,
  })  : _authInteractor = authInteractor,
        super(const AuthState()) {
    on<AuthUserSubscribed>(_onAuthUserSubscribed);
  }


  final AuthInteractor _authInteractor;

  void _onAuthUserSubscribed(
      AuthUserSubscribed event,
      Emitter<AuthState> emit,
      ) {
    _authInteractor.observeUser().listen((user) {
      emit(state.copyWith(user: user));

      print('I work');
      if(user != null){
        _authInteractor.saveUser(user);
      }
    });
  }
}
