part of 'profile_bloc.dart';

 class ProfileState extends Equatable {

  final User? user;

  const ProfileState({this.user});

  ProfileState copyWith({
   User? user,
 }){
   return ProfileState(
    user: user ?? this.user,
   );
  }

  @override
  List<Object?> get props => [];
}
