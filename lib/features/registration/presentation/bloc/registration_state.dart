part of 'registration_bloc.dart';

class RegistrationState extends Equatable {
  final bool isLoading;
  final bool needPop;

  const RegistrationState({required this.isLoading, required this.needPop});

  RegistrationState copyWith({
    bool? isLoading,
    bool? needPop,
  }) {
    return RegistrationState(
      isLoading: isLoading ?? this.isLoading,
      needPop: needPop ?? this.needPop,
    );
  }

  @override
  List<Object?> get props => [isLoading, needPop];
}
