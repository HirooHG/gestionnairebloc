import 'package:gestionnairebloc/domain/entities/password.dart';
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

  Future<void> delete(Password pwd) async {
    var sql = "delete from pwd where id = ${pwd.id};";
    await execQuery(sql);
  }

  Future<void> update(Password pwd) async {
    var sql = "update pwd "
        "set website = '${pwd.website}', "
        "identifier = '${pwd.identifier}', "
        "pwd = '${pwd.pwd}' "
        "where id = ${pwd.id};";
    await execQuery(sql);
  }

  Future<void> create(Password pwd) async {
    var sql = "insert into pwd(website, identifier, pwd) "
        "values ('${pwd.website}', '${pwd.identifier}', '${pwd.pwd}');";
    await execQuery(sql);
  }

  Future<List<Password>> getPwds() async {
    var sql = "select * from pwd;";
    var pwdsRaw = await rawQuery(sql);
    return pwdsRaw.map((e) => Password.fromJson(e)).toList();
  }

  // raw queries
  Future<void> execQuery(String sql) async {
    var db = await initializeDB();
    db.execute(sql);
  }

  Future<List<Map<String, Object?>>> rawQuery(String sql) async {
    var db = await initializeDB();
    return db.rawQuery(sql);
  }
}
