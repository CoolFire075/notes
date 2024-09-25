import 'package:get_it/get_it.dart';
import 'package:notes/core/di/core_module.dart';
import 'package:notes/features/auth/di/auth_module.dart';
import 'package:notes/features/home/di/home_module.dart';
import 'package:notes/features/login/di/lodin_module.dart';
import 'package:notes/features/notes/di/notes_module.dart';
import 'package:notes/features/notes_list/di/notes_list_module.dart';
import 'package:notes/features/profile/di/profile_module.dart';
import 'package:notes/features/registration/di/registration_module.dart';

final getIt = GetIt.instance;

void initDependencyInjection() {
  initCoreModule();
  initAuthModule();
  initHomeModule();
  initNotesModule();
  initNotesListModule();
  initProfileModule();
  initLoginModule();
  initRegistrationModule();
}
