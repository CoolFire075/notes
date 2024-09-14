import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../notes_interactor.dart';
import '../data/repository/models/note.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit({required NotesInteractor notesInteractor, int? id})
      : _notesInteractor = notesInteractor,
        super(NoteState(title: '', content: '', needExit: false)) {
    if (id != null) _LoadNoteById(id);
  }

  final NotesInteractor _notesInteractor;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  void updateTitle(String title) {
    emit(state.copyWith(title: title));
  }

  void updateContent(String content) {
    emit(state.copyWith(content: content));
  }

  void saveNote() async {
    final note = Note(title: state.title, content: state.content);
    final id = await _notesInteractor.saveNote(note);
    debugPrint('### noteCubit -> saveNote -> id: $id');
    emit(state.copyWith(needExit: true));
  }

  void _LoadNoteById(int id) async {
    emit(state.copyWith(id: id, isLoading: true));
    await Future.delayed(Duration(milliseconds: 300));
    final note = await _notesInteractor.getNoteById(id);
    titleController.text = note?.title ?? '';
    contentController.text = note?.content ?? '';
    emit(state.copyWith(isLoading: false));
  }
}
