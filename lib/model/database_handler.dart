import 'package:gestionnairebloc/controller/entities/password.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHandler {
  final dbname = 'manager.db';

  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, dbname),
      onCreate: (database, version) async {
        await database.execute("create table pwd("
            "id integer primary key autoincrement,"
            "website text not null,"
            "identifier text not null,"
            "pwd text not null);");
      },
      version: 1,
    );
  }

  Future<int> delete(Password pwd) async {
    Database db = await initializeDB();
    return await db.delete('pwd', where: 'id = ?', whereArgs: [pwd.id]);
  }

  Future<int> update(Password pwd) async {
    Database db = await initializeDB();
    return await db
        .update('pwd', pwd.toJson(), where: 'id = ?', whereArgs: [pwd.id]);
  }

  Future<int> create(Password pwd) async {
    Database db = await initializeDB();
    return await db.insert('pwd', pwd.toJson());
  }

  Future<List<Password>> getPwds() async {
    Database db = await initializeDB();
    return (await db.query('pwd')).map((e) => Password.fromJson(e)).toList();
  }
}
