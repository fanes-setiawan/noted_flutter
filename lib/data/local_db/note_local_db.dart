import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/note_model.dart';

class NoteLocalDB {
  final String dbName = "noted_local_db";
  final String tableName = "notes";

//buat table dalam database
  Future<Database> _initNoteLocalDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, dbName);
    return await openDatabase(
      path,
      onCreate: (db, version) {
        return db.execute('''
Create table $tableName(
  id integer primary key autoincrement,
  title text not null,
  content text not null,
  createdTime text not null
)
''');
      },
      version: 1,
    );
  }

  // insert data note ke table
  Future<void> insertNote(Note note) async {
    final db = await _initNoteLocalDB();
    await db.insert(
      tableName,
      note.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  //mengambil data dari tabel
  Future<List<Note>> getAllNote() async {
    final db = await _initNoteLocalDB();
    final List<Map<String, dynamic>> result = await db.query(tableName);

    return List.generate(result.length, (index) {
      return Note.fromMap(result[index]);
    });
  }

  //update data
  Future<void> updateNote(Note note) async {
    final db = await _initNoteLocalDB();
    await db.update(
      tableName,
      note.toMap(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  //delete/hapus data dari tabel
  Future<void> deleteNote(int id) async {
    final db = await _initNoteLocalDB();

    await db.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
