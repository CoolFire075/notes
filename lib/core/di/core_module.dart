import 'package:notes/core/database/notes_database.dart';
import 'package:notes/core/navigation/notes_router.dart';

import 'dependency_injection.dart';

void initCoreModule() {
  getIt.registerSingleton(NotesDatabase());
  getIt.registerSingleton(NotesRouter());
}
