// import 'package:sqflite/sqflite.dart';

// Sheet DB를 homeController init하면서 객체로 선언하면 된다.
// ** chat_repository 11줄 확인

// class ChatRoomDB {
//   static Database _database;

//   // 맨처음에, 없으면 initDB, 있으면 그냥 리턴
//   Future<Database> get database async {
//     if (_database != null) return _database;

//     _database = await initChatRoomsDB();
//     return _database;
//   }

//   // initChatRoomsDB init
//   initChatRoomsDB() async {
//     // ChatRoom.db가 디비 이름
//     String path = join(await getDatabasesPath(), 'ChatRoom.db');
//     return await openDatabase(path, version: 1, onCreate: (db, version) async {
//       await db.execute('''CREATE TABLE IF NOT EXISTS $tableName(
//           $columnRowId integer primary key autoincrement,
//           $columnRoomId text not null,
//           $columnTitle text not null,
//           $columnlastMessage text not null,
//           $columnPosition integer not null
//           )''');
//     }, onUpgrade: (db, oldVersion, newVersion) {});
//   }

//   Future<void> insertChatRoom(ChatRoom chatRoom) async {
//     final db = await database;
//     var res = await db.rawInsert(
//         'INSERT INTO $tableName(rowId, roomId, title, lastMessage, position) VALUES(?,?,?,?,?)',
//         [null, chatRoom.roomId, chatRoom.title, null, null]);
//     //var res = await db.insert(tableName, mapping.toJson());
//     return res;
//   }

//   // READ: 모든 채팅방 TODO: 추후 position 값에 따라서 DESC로
//   Future<List<ChatRoom>> getAllChatRooms() async {
//     final db = await database;
//     var res = await db.query(tableName); // tableName: ChatRoom
//     List<ChatRoom> list =
//         res.isNotEmpty ? res.map((c) => ChatRoom.fromJson(c)).toList() : [];

//     return list;
//   }

//   // DELETE: 채팅방 삭제 => roomID 찾아서 한 행 삭제 (대화방 나갈 때 쓴다)
//   void deleteChatRoom(String roomId) async {
//     final db = await database;
//     List res =
//         await db.rawQuery('DELETE FROM $tableName WHERE roomId = ?', [roomId]);
//     print(res);
//   }

//   // DELETE: 모든 채팅방 삭제 TODO: 어플 삭제 시, 같이 삭제
//   void deleteAllChatRoom() async {
//     final db = await database;
//     db.delete(tableName);
//   }
// }
