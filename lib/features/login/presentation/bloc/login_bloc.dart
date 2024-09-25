import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:notes/features/auth/domain/auth_interactor.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required AuthInteractor authInteractor,
  })  : _authInteractor = authInteractor,
        super(const LoginState(isLoading: false, needPop: false)) {
    on<LoginGoogleIconClicked>(_onLoginGoogleIconClicked);
  }

  final AuthInteractor _authInteractor;

  void _onLoginGoogleIconClicked(
    LoginGoogleIconClicked event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      final credential = await _authInteractor.getGoogleCredential();
      final userCredential = await _authInteractor.signInWithGoogle(credential);
      emit(state.copyWith(needPop: true));
    } catch (e) {
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}
