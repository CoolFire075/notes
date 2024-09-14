part of 'notes_list_bloc.dart';
class NotesListState {
  final List notes;

  NotesListState({required this.notes});

  NotesListState copyWith({
    List? notes
  }) {
    return NotesListState(
      notes: notes ?? this.notes,
    );
  }
}