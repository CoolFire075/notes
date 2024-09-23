import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/domain/auth_interactor.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({
    required AuthInteractor authInteractor,
  })
      : _authInteractor = authInteractor,
        super(const ProfileState()) {
    on<ProfileUserSubscribed>(_onProfileUserSubscribed);
    on<ProfileCurrentUserLoaded>(_onProfileCurrentUserLoaded);
  }

  final AuthInteractor _authInteractor;

  void _onProfileUserSubscribed(ProfileUserSubscribed event,
      Emitter<ProfileState> emit,) {
    _authInteractor.observeUser().listen((user) {
      emit(state.copyWith(user: user));
      debugPrint('PROFILE_BLOC => user; $user');
    });
  }

  void _onProfileCurrentUserLoaded(ProfileCurrentUserLoaded event,
      Emitter<ProfileState> emit,) {
    final user = _authInteractor.getUser();
    debugPrint('PROFILE_BLOC => _onProfileCurrentUserLoaded => user : $user');
    emit(state.copyWith(user: user));
  }
}
