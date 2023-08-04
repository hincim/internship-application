import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'model/local_user.dart';

class DB {

  static final DB instance = DB._init();
  static Database? _database;

  DB._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('infoSystem.db');

    return _database!;
  }

  Future<Database> _initDB(String filePath) async{

    final path = join(await getDatabasesPath(),filePath);

    return await openDatabase(path,version: 1,onCreate: _createDB);

  }

  Future _createDB(Database db, int version) async{

    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const integerType = 'INTEGER NOT NULL';
    const textType = 'TEXT NOT NULL';

    await db.execute('''
    CREATE TABLE IF NOT EXISTS $tableNameUsers (
    ${LocalUsersTableFields.id} $idType,
    ${LocalUsersTableFields.email} $textType,
    ${LocalUsersTableFields.phone} $integerType
    )
    ''');
  }

  Future<LocalUsers> insertUser(LocalUsers person) async{

    final db = await instance.database;
    final id = await db.insert(tableNameUsers, person.toJson());
    return person.copy(id: id);
  }

  Future<List<LocalUsers>> getUserInfo(String email) async{

    final db = await instance.database;
    final result = await db.query(tableNameUsers,where: "${LocalUsersTableFields.email}=?",
    whereArgs: [email]);
    return result.map((json) => LocalUsers.fromJson(json)).toList();
  }

  Future close() async{
    final db = await instance.database;
    db.close();
  }
}