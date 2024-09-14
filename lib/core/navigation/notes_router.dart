import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/core/navigation/routes/note_route.dart';
import 'package:notes/core/navigation/routes/notes_list_route.dart';
import 'package:notes/core/navigation/routes/reminders_route.dart';
import 'package:notes/features/home/presentation/screen/home_page.dart';
import 'package:notes/features/profile/presentation/screen/profile_page.dart';
import 'package:notes/features/reminders/presentation/screen/reminders_page.dart';

import '../../features/notes/presentation/screen/note_page.dart';
import '../../features/notes_list/presentation/screen/notes_list_page.dart';

class NotesRouter {
  final GoRouter _router = GoRouter(
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (contex, state, child) => HomePage(navigationShell: child),
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: NotesListRoute.name,
                pageBuilder: (context, state) => const MaterialPage(
                  child: NotesListPage(),
                ),
                routes: [
                  GoRoute(
                    path: NoteRoute.name,
                    pageBuilder: (context, state) {
                      final idString = state.uri.queryParameters[NoteRoute.idKeyArg];
                      final id = int.tryParse(idString ?? '');
                      return MaterialPage(
                        child: NotePage(id: id,),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                  path: RemindersRoute.name,
                  pageBuilder: (context, state) => const MaterialPage(child: RemindersPage()))
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                  path: RemindersRoute.name,
                  pageBuilder: (context, state) => const MaterialPage(child: ProfilePage()))
            ],
          ),
        ],
      ),
    ],
  );

  GoRouter get router => _router;
}
