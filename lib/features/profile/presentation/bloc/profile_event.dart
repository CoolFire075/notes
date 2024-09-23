part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object?> get props => [];
}

class ProfileUserSubscribed extends ProfileEvent {}
class ProfileCurrentUserLoaded extends ProfileEvent{}