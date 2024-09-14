import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../features/notes/presentation/data/db/notes_db_service.dart';


class NotesDatabase {
  static const String _databaseName = 'notes.db';
  static const int _databaseVersion = 1;

  Database? _database;

  Future<Database> get database async {
    if (_database == null) {
      _database = await _initDatabase();
    }
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();

    final path = join(databasePath, _databaseName);

    return await openDatabase(
      path,
      onCreate: _onCreate,
      version: _databaseVersion,
    );
  }

  Future<void> _onCreate(Database db, int version) async{
    debugPrint('\#\#\# _onCreate');

    await db.execute('''
    CREATE TABLE ${NotesDbService.tableName}(
    ${NotesDbService.columnId} INTEGER PRIMARY KEY AUTOINCREMENT,
    ${NotesDbService.columnTitle} TEXT,
    ${NotesDbService.columnContent} TEXT
    )
    ''');
  }
}
