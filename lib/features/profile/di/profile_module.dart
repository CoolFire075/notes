import '../../../core/di/dependency_injection.dart';
import '../presentation/bloc/profile_bloc.dart';

void initProfileModule() {
  getIt.registerFactory(() => ProfileBloc(authInteractor: getIt()));
}
