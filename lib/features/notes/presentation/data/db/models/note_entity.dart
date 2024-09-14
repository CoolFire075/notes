import 'package:equatable/equatable.dart';

import '../notes_db_service.dart';

class NoteEntity extends Equatable {
  final int? id;
  final String title;
  final String content;

  const NoteEntity({
    this.id,
    required this.title,
    required this.content,
  });

  factory NoteEntity.fromJson(Map<String, dynamic> json) {
    return NoteEntity(
      id: json[NotesDbService.columnId],
      title: json[NotesDbService.columnTitle],
      content: json[NotesDbService.columnContent],
    );
  }

  Map<String, dynamic> toJson() => {
        NotesDbService.columnId: id,
        NotesDbService.columnTitle: title,
        NotesDbService.columnContent: content,
      };

  @override
  List<Object?> get props => [
        id,
        title,
        content,
      ];
}
