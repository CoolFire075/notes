import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/navigation/routes/note_route.dart';
import '../../../../core/di/dependency_injection.dart';
import '../bloc/notes_list_bloc.dart';

class NotesListPage extends StatelessWidget {
  const NotesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<NotesListBloc>()..add(NotesDataLoaded()),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Notes List"),
        ),
        body: _Body(),
        floatingActionButton: _CreateButton(),
      ),
    );
  }
}

class _CreateButton extends StatelessWidget {
  const _CreateButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final notesListBloc = context.read<NotesListBloc>();
    return FloatingActionButton(
      child: Icon(Icons.note_add_outlined),
      onPressed: () {
        context.push('/note').then((value) {
          notesListBloc.add(NotesDataLoaded());
        });
      },
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesListBloc, NotesListState>(
      builder: (context, state) {
        final notes = state.notes;
        return ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            final note = notes[index];
            return ListTile(
              leading: Icon(Icons.notes_outlined),
              title: Text(
                note.title,
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text(note.content),
              onTap: () {
                final id = note.id;
                if (id == null) return;
                context.go(NoteRoute.getRouteWithArgs(id));
              },
            );
          },
          itemCount: notes.length,
        );
      },
    );
  }
}
