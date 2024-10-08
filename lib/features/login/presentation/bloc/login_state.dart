part of 'login_bloc.dart';

class LoginState extends Equatable {
  final bool isLoading;
  final bool needPop;

  const LoginState({required this.isLoading, required this.needPop});

  LoginState copyWith({
    bool? isLoading,
    bool? needPop,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      needPop: needPop ?? this.needPop,
    );
  }

  @override
  List<Object?> get props => [isLoading, needPop];
}
