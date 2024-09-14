import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../notes/notes_interactor.dart';

part 'notes_list_event.dart';

part 'notes_list_state.dart';

class NotesListBloc extends Bloc<NotesListEvent, NotesListState> {
  NotesListBloc({
    required NotesInteractor notesInteractor,
  })
      : _notesInteractor = notesInteractor,
        super(NotesListState(notes: [])) {

    on<NotesDataLoaded>(_onNotesDataLoaded);

  }


  final NotesInteractor _notesInteractor;

  void _onNotesDataLoaded(NotesDataLoaded event,
      Emitter<NotesListState> emit,) async {
    final notes = await _notesInteractor.getNotes();
    debugPrint('### NotesListBloc -> notes: $notes');
    emit(state.copyWith(notes: notes));
  }
}