import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class NoteLocalDB {
  final String dbName = "noted_local_db";
  final String tableName = "notes";

  Future<Database> _initNoteLocalDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, dbName);
    return await openDatabase(path, onCreate: (db, version) {
      return db.execute('''
Create table $tableName(
  id integer primary key autoincrement,
  title text not null,
  content text not null,
  createdTime text not null
)
''');
    });
  }
}
