import 'package:notes/features/auth/data/service/firebase_auth_service.dart';
import 'package:notes/features/auth/domain/auth_interactor.dart';
import 'package:notes/features/auth/domain/repository/auth_local_repository_impl.dart';
import 'package:notes/features/auth/domain/repository/auth_local_repository.dart';
import 'package:notes/features/auth/presentation/bloc/auth_bloc.dart';

import '../../../core/di/dependency_injection.dart';
import '../data/repository/auth_remote_repository.dart';
import '../data/repository/auth_remote_repository_impl.dart';

void initAuthModule() {
  getIt.registerLazySingleton(() => FirebaseAuthService());
  getIt.registerLazySingleton<AuthRemoteRepository>(() => AuthRemoteRepositoryImpl(authService: getIt()));
  // getIt.registerLazySingleton<AuthLocalRepository>(() => AuthLocalRepositoryImpl(authService: getIt()));
  getIt.registerLazySingleton<AuthLocalRepository>(() => AuthLocalRepositoryImpl());
  getIt.registerFactory(() => AuthInteractor(remoteRepository: getIt(), localRepository: getIt()));
  getIt.registerFactory(() => AuthBloc(authInteractor: getIt()));
}
