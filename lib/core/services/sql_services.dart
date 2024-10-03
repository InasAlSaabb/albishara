import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDb {
  static Database? _db;
  Future<Database?> get db async {
    if (_db == null) {
      _db = await initialDb();
      return _db;
    } else {
      return _db;
    }
  }

  initialDb() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'albishara.db');
    Database mydb = await openDatabase(path,
        onCreate: _onCreate, version: 5, onUpgrade: _onUpgrade);
    return mydb;
  }

  _onUpgrade(Database db, int oldversion, int newversion) async {
    print("upp*******************");
    // await db.execute("ALTER TABLE notes ADD COLUMN 'name' TEXT");
  }

  _onCreate(Database db, int version) async {
    Batch batch = db.batch();
    //exexec one time
    batch.execute('''
CREATE TABLE "M"(
"id" INTEGER ,
"chrcnt" INTEGER ,
"kaComp" INTEGER,
"name" TEXT ,
"basl" TEXT ,
"tp" INTEGER

)


''');
    batch.execute('''
CREATE TABLE "V"(
"id" INTEGER ,
"chrcnt" INTEGER ,
"kaComp" INTEGER,
"name" TEXT ,
"basl" TEXT ,
"tp" INTEGER
)


''');
    batch.execute('''
CREATE TABLE "K"(
"id" INTEGER ,
"chrcnt" INTEGER ,
"kaComp" INTEGER,
"name" TEXT ,
"basl" TEXT ,
"tp" INTEGER
)


''');
    batch.execute('''
CREATE TABLE "P"(
"id" INTEGER ,
"chrcnt" INTEGER ,
"kaComp" INTEGER,
"name" TEXT ,
"basl" TEXT ,
"tp" INTEGER
)


''');
    batch.execute('''
CREATE TABLE "H"(
"id" INTEGER ,
"chrcnt" INTEGER ,
"kaComp" INTEGER,
"name" TEXT ,
"basl" TEXT ,
"tp" INTEGER
)


''');
    batch.execute('''
CREATE TABLE "SY"(
"id" INTEGER ,
"chrcnt" INTEGER ,
"kaComp" INTEGER,
"name" TEXT ,
"basl" TEXT ,
"tp" INTEGER
)


''');
    batch.execute('''
CREATE TABLE "GR"(
"id" INTEGER ,
"chrcnt" INTEGER ,
"kaComp" INTEGER,
"name" TEXT ,
"basl" TEXT ,
"tp" INTEGER
)


''');
    batch.execute('''
CREATE TABLE "HE"(
"id" INTEGER ,
"chrcnt" INTEGER ,
"kaComp" INTEGER,
"name" TEXT ,
"basl" TEXT ,
"tp" INTEGER
)


''');
    batch.execute('''
CREATE TABLE "FR"(
"id" INTEGER ,
"chrcnt" INTEGER ,
"kaComp" INTEGER,
"name" TEXT ,
"basl" TEXT ,
"tp" INTEGER
)


''');

    batch.execute('''
CREATE TABLE "asfar"(
"id" INTEGER ,
"trans" TEXT,
"chrcnt" INTEGER ,
"kaComp" INTEGER,
"name" TEXT ,
"basl" TEXT ,
"tp" INTEGER
)


''');
    batch.execute('''
CREATE TABLE "ayat"(
"id" INTEGER ,
"sfrnr" INTEGER,
"hid" TEXT ,
"chnr" INTEGER,
"vnumber" INTEGER,
"textch" TEXT,
"tid" TEXT,
"trans" TEXT

)


''');
    batch.commit();
    print("CREATE ********************");
  }

  // readData(String sql, List<Object> list) async {
  //   Database? mydb = await db;
  //   List<Map> response = await mydb!.rawQuery(sql);
  //   print("read***********");
  //   return response;
  // }
  Future<List<Map<String, dynamic>>> readData(
    String sql,
    List<Object> params,
  ) async {
    // Get the database instance
    Database? mydb = await db;

    // Execute the raw query
    List<Map<String, dynamic>> response = await mydb!.rawQuery(sql, params);

    // Optional: Log the response for debugging
    print("read***********");

    return response;
  }

  insertData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    return response;
  }

  Future<bool> recordExists(String table, int id) async {
    Database? mydb = await db;
    List<Map<String, dynamic>> result = await mydb!.query(
      table,
      where: 'id = ?',
      whereArgs: [id],
    );
    return result.isNotEmpty;
  }

  updateData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }

  deleteData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }

  mydeletDatabase() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'inas.db');
    await deleteDatabase(path);
  }

  read(String table) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.query(table);
    return response.toSet();
  }

  readmod(
    String table, {
    String? where,
    List<Object>? whereArgs,
    List<String>? columns,
  }) async {
    Database? mydb = await db;
    // استعلام البيانات
    List<Map<String, dynamic>> response = await mydb!.query(
      table,
      columns: columns,
      where: where,
      whereArgs: whereArgs,
    );

    print("Response: $response"); // طباعة النتائج

    // تحقق من وجود بيانات
    if (response.isEmpty) {
      print("No data found.");
      return {}; // أو يمكنك إرجاع مجموعة فارغة
    }

    return response;
  }

  insert(String table, Map<String, Object?> val) async {
    Database? mydb = await db;
    int response = await mydb!.insert(table, val);
    print("***************insert");
    return response;
  }

  update(String table, Map<String, Object?> val, String? mywhere) async {
    Database? mydb = await db;
    int response = await mydb!.update(table, val, where: mywhere);
    return response;
  }

  delete(String table, String? mywhere) async {
    Database? mydb = await db;
    int response = await mydb!.delete(table, where: mywhere);
    return response;
  }
}
