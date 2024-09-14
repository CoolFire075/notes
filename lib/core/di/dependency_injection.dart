import 'package:get_it/get_it.dart';
import 'package:notes/core/di/core_module.dart';
import 'package:notes/features/notes/di/notes_module.dart';
import 'package:notes/features/notes_list/di/notes_list_module.dart';

final getIt = GetIt.instance;

void initDependencyInjection() {
  initCoreModule();
  initNotesModule();
  initNotesListModule();
}
