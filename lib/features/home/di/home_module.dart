import 'package:notes/features/home/presentation/bloc/home_cubit.dart';

import '../../../core/di/dependency_injection.dart';

void initHomeModule() {
  getIt.registerFactory(() => HomeCubit());
}
