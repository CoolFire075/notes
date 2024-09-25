import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:notes/features/auth/domain/auth_interactor.dart';

part 'registration_event.dart';

part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc({
    required AuthInteractor authInteractor,
  })  : _authInteractor = authInteractor,
        super(const RegistrationState(isLoading: false, needPop: false)) {
  }

  final AuthInteractor _authInteractor;
}
