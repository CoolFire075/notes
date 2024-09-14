
import '../../../../core/navigation/routes/notes_list_route.dart';
import '../../../../core/navigation/routes/profile_route.dart';
import '../../../../core/navigation/routes/reminders_route.dart';

enum NotesBottomNavItem {
  notesList(path: NotesListRoute.name),
  reminders(path: RemindersRoute.name),
  profile(path: ProfileRoute.name);

  final String path;

  const NotesBottomNavItem({required this.path});
}