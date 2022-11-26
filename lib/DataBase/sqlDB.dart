import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqlDB {
  static Database? _db;
  Future<Database?> get db async {
    if (_db == null) {
      _db = await initial();
      return _db;
    } else {
      return _db;
    }
  }

  initial() async {
    String dataPath = await getDatabasesPath();
    String path = join(dataPath, "AppDB.db");
    Database db = await openDatabase(path,
        onCreate: onCreate, version: 1, onUpgrade: onUpgrade);
    return db;
  }

  Future<void> onUpgrade(Database db, int oldVersion, int newVersion) async {
    Batch batch = db.batch();
    batch.execute('''
ALTER JOIN ADD COLMN("image" TEXT)

)
''');
    batch.commit();
  }

  onCreate(Database db, int version) async {
    Batch batch = db.batch();
    batch.execute('''
CREATE TABLE "users" (
  "id" INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT ,
"name" TEXT NOT NULL ,
"phone" TEXT ,
"type" TEXT  NOT NULL
)
''');
    batch.execute('''
CREATE TABLE "money" (
  "id" INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT ,
"amount" INTEGER NOT NULL,
"details" TEXT ,
"user_id" INTEGER NOT NULL,
"type" TEXT ,
"date" TEXT ,
"time" TEXT
)
''');
    batch.execute('''
CREATE TABLE "outly" (
  "id" INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT ,
"title" TEXT NOT NULL ,
"amount" INTEGER NOT NULL,
"details" TEXT ,
"data" TEXT NOT NULL ,
"total_date" TEXT ,
"time" TEXT NOT NULL
)
''');

    batch.commit();
    print("on creat +++++++++++++++++");
  }

  readData(String sql) async {
    Database? myDB = await db;
    List<Map> res = await myDB!.rawQuery(sql);
    return res;
  }

  insertData(String sql) async {
    Database? myDB = await db;
    int res = await myDB!.rawInsert(sql);
    return res;
  }

  updateData(String sql) async {
    Database? myDB = await db;
    int res = await myDB!.rawUpdate(sql);
    return res;
  }

  deleteData(String sql) async {
    Database? myDB = await db;
    int res = await myDB!.rawDelete(sql);
    return res;
  }

  get(String table, String? where, List<Object?>? list) async {
    Database? myDB = await db;
    List<Map> res = await myDB!.query(table, where: where, whereArgs: list);
    return res;
  }

  post(String table, Map<String, Object?> values) async {
    Database? myDB = await db;
    int res = await myDB!.insert(table, values);
    return res;
  }

  update(String table, Map<String, Object?> values, String where) async {
    Database? myDB = await db;
    int res = await myDB!.update(table, values, where: where);
    return res;
  }

  delete(String table, String where) async {
    Database? myDB = await db;
    int res = await myDB!.delete(table, where: where);
    return res;
  }

  deleteDB() async {
    String dataPath = await getDatabasesPath();
    String path = join(dataPath, "AppDB.db");
    await deleteDatabase(path);
  }
}
