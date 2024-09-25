import '../../../core/di/dependency_injection.dart';
import '../presentation/bloc/registration_bloc.dart';

void initRegistrationModule() {
  getIt.registerFactory(() => RegistrationBloc(authInteractor: getIt()));
}
