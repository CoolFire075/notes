import 'package:notes/core/database/notes_database.dart';
import 'package:sqflite/sqflite.dart';

import 'models/note_entity.dart';

class NotesDbService {
  static const tableName = 'notes';
  static const columnId = 'id';
  static const columnTitle = 'title';
  static const columnContent = 'content';

  final NotesDatabase _notesDatabase;

  NotesDbService({required NotesDatabase notesDatabase}) : _notesDatabase = notesDatabase;

  Future<int> insertNote(NoteEntity entity) async {
    final database = await _notesDatabase.database;
    return database.insert(tableName, entity.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<NoteEntity>> getNotes() async {
    final db = await _notesDatabase.database;
    final List<Map<String, dynamic>> maps = await db.query(tableName);
    return maps.map((e) => NoteEntity.fromJson(e)).toList();
  }

  Future<NoteEntity?> getNoteById(int id) async {
    final db = await _notesDatabase.database;
    final List<Map<String, dynamic>> maps =
        await db.query(tableName, where: '${columnId} = ?', whereArgs: [id]);
    return maps.isNotEmpty ? NoteEntity.fromJson(maps[0]) : null;
  }
}
