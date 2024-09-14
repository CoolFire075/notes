
import '../../../core/di/dependency_injection.dart';
import '../domain/repository/notes_local_repository_impl.dart';
import '../notes_interactor.dart';
import '../notes_local_repository.dart';
import '../presentation/cubit/note_cubit.dart';
import '../presentation/data/db/notes_db_service.dart';

void initNotesModule(){


  getIt.registerLazySingleton(()=> NotesDbService(notesDatabase: getIt()));

  getIt.registerLazySingleton<NotesLocalRepository>(() => NotesLocalRepositoryImpl(notesDbService: getIt()));

  getIt.registerFactory(()=> NotesInteractor(notesLocalRepository: getIt()));

  getIt.registerFactoryParam((int? param1, param2)=> NoteCubit(notesInteractor: getIt(), id: param1));
}