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
  })  : _authInteractor = authInteractor,
        super(const ProfileState(isLoading: true)) {
    on<ProfileUserSubscribed>(_onProfileUserSubscribed);
    on<ProfileUserChanged>(_onProfileUserChanged);
    on<ProfileCurrentUserLoaded>(_onProfileCurrentUserLoaded);
    on<ProfileLogOutButtonClicked>(_onProfileLogOutButtonClicked);
  }

  final AuthInteractor _authInteractor;

  void _onProfileUserSubscribed(
    ProfileUserSubscribed event,
    Emitter<ProfileState> emit,
  ) {
    _authInteractor.observeUser().listen((user) {
      add(ProfileUserChanged(user: user));
      debugPrint('PROFILE_BLOC => observeLocalUser => user: $user');
    });
  }

  void _onProfileCurrentUserLoaded(
    ProfileCurrentUserLoaded event,
    Emitter<ProfileState> emit,
  ) {
    final user = _authInteractor.getUser();
    debugPrint('PROFILE_BLOC => _onProfileCurrentUserLoaded => user : $user');
    emit(state.copyWith(user:() => user, isLoading: false));
  }

  void _onProfileLogOutButtonClicked(
    ProfileLogOutButtonClicked event,
    Emitter<ProfileState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    await _authInteractor.logOut();
    emit(state.copyWith(isLoading: false));
  }

  void _onProfileUserChanged(
    ProfileUserChanged event,
    Emitter<ProfileState> emit,
  ) {
    emit(state.copyWith(user:() => event.user));
  }
}
