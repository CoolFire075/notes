import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState(isLoading: false)) {
    on<LoginGoogleIconClicked>(_onLoginGoogleIconClicked);
    }

    void _onLoginGoogleIconClicked(
        LoginGoogleIconClicked event,
        Emitter<LoginState> emit,
        )async{

    }
  }

