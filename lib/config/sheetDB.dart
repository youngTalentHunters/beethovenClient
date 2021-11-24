import 'package:beethoven/model/customScale.dart';
import 'package:beethoven/model/customSheet.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

final String tableName = 'Sheet';
final String columnRowId = 'rowId';
final String columnTitle = 'title';
final String columnId = 'id';
final String columnCreatedAt = 'createdAt';

class SheetDB {
  static Database _database;

  // 맨처음에, 없으면 initDB, 있으면 그냥 리턴
  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initSheetsDB();
    return _database;
  }

  // initSheetsDB init
  initSheetsDB() async {
    String path = join(await getDatabasesPath(), 'Sheet.db');
    return await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute('''CREATE TABLE IF NOT EXISTS $tableName(
          $columnRowId integer primary key autoincrement,
          $columnTitle text not null,
          $columnId integer not null,
          $columnCreatedAt text not null
          )''');
    }, onUpgrade: (db, oldVersion, newVersion) {});
  }

  Future<int> insertData(CustomSheet customSheet) async {
    final db = await database;
    var res = await db.rawInsert(
        'INSERT INTO $tableName(rowId, title, id, createdAt) VALUES(?,?,?,?)', [
      null,
      customSheet.title,
      customSheet.id,
      customSheet.createdAt.toString()
    ]);
    print(res);
    return res;
  }

  Future<List<CustomSheet>> getAllData() async {
    final db = await database;
    var res = await db.query(tableName);
    List<CustomSheet> list =
        res.isNotEmpty ? res.map((c) => CustomSheet.fromJson(c)).toList() : [];
    return list;
  }

  // DELETE
  void deleteData(int rowId) async {
    final db = await database;
    var res =
        await db.rawQuery('DELETE FROM $tableName WHERE rowId = ?', [rowId]);
    print(res);
    print("sheet 삭제");
  }

  // DELETE: 모든 sheet 삭제
  void deleteAllData() async {
    final db = await database;
    var res = db.delete(tableName);
    print(res);
    print("sheet 전체 삭제");
  }

  // Future<List<ChatRoom>> getData() async {
  //   final db = await database;
  //   var res = await db.query(tableName); // tableName: ChatRoom
  //   CustomScale scale = CustomScale.fromJson(res);
  //   List<ChatRoom> list =
  //       res.isNotEmpty ? res.map((c) => ChatRoom.fromJson(c)).toList() : [];

  //   return list;
  // }
}
