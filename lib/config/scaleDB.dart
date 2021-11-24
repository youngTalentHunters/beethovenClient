import 'package:beethoven/model/customScale.dart';
import 'package:beethoven/model/customSheet.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

final String tableName = 'Scale';
final String columnRowId = 'rowId';
final String columnSheetId = 'sheetId';
final String columnText = 'text';
final String columnImageUrl = 'imageUrl';
final String columnCreatedAt = 'createdAt';

class ScaleDB {
  static Database _database;

  // 맨처음에, 없으면 initDB, 있으면 그냥 리턴
  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initSheetsDB();
    return _database;
  }

  // initSheetsDB init
  initSheetsDB() async {
    String path = join(await getDatabasesPath(), 'Scale.db');
    return await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute('''CREATE TABLE IF NOT EXISTS $tableName(
          $columnRowId integer primary key autoincrement,
          $columnSheetId integer not null,
          $columnText text not null,
          $columnImageUrl text not null,
          $columnCreatedAt text not null
          )''');
    }, onUpgrade: (db, oldVersion, newVersion) {});
  }

  Future<void> insertData(CustomScale customScale) async {
    final db = await database;
    var res = await db.rawInsert(
        'INSERT INTO $tableName(rowId, sheetId, text, imageUrl, createdAt) VALUES(?,?,?,?,?)',
        [
          null,
          customScale.sheetId,
          customScale.text,
          customScale.imageUrl,
          customScale.createdAt.toString()
        ]);
    print("scale insert 후 index 넘버인 듯? : " + res.toString());
    return res;
  }

  Future<List<CustomScale>> getAllDataBySheetId(int sheetId) async {
    final db = await database;
    var res = await db.rawQuery(
        'SELECT rowId, sheetId, text, imageUrl, createdAt FROM $tableName WHERE sheetId = ? ',
        [sheetId]);
    List<CustomScale> list =
        res.isNotEmpty ? res.map((c) => CustomScale.fromJson(c)).toList() : [];
    return list;
  }

  // DELETE
  void deleteDataBySheetId(int sheetId) async {
    final db = await database;
    var res = await db
        .rawQuery('DELETE FROM $tableName WHERE sheetId = ?', [sheetId]);
    print(res);
    print("sheet 삭제");
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
