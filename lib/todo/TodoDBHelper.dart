import 'dart:async';
import 'dart:io';

import 'package:flutter_app/sqlite-demo/User.dart';
import 'package:flutter_app/todo/NoDoItem.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';


class TodoDBHelper {

  static final TodoDBHelper _instance =new TodoDBHelper.internal(); // internal refer to internal constructor
  static Database _db;
  final String tableName = "todoTable";
  final String columnId = "id";
  final String columnItemname = "itemName";
  final String columnDateCreated = "dateCreated";

  //A factory constructor is permitted to return an existing instance
  factory TodoDBHelper()=> _instance;

  TodoDBHelper.internal();

  Future<Database> get db async {
    // getter for db
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  Future<Database> initDb() async {
    // get app directory for android or ios
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "notodo_db.db");
    var ourDb = await openDatabase(path, version: 1, onCreate: _onDbCreate);
    return ourDb;
  }

  void _onDbCreate(Database db, int version) async {
        await db.execute(
            "CREATE TABLE $tableName(id INTEGER PRIMARY KEY, $columnItemname TEXT, $columnDateCreated TEXT)");
  }

  // CRUD operations
  Future<int> saveItem(NoDoItem item) async {
    var dbClient = await db;
    int res = await dbClient.insert("$tableName", item.toMap());
    return res;
  }

  //Get
  Future<List> getItems() async {
    var dbClient = await db;
    var result = await dbClient.rawQuery("SELECT * FROM $tableName ORDER BY $columnItemname ASC"); //ASC
    return result.toList();

  }

  Future<int> getCount() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(await dbClient.rawQuery(
        "SELECT COUNT(*) FROM $tableName"
    ));
  }
//
  Future<NoDoItem> getItem(int id) async {
    var dbClient = await db;
    var result = await dbClient.rawQuery("SELECT * FROM $tableName WHERE id = $id");
    if (result.length == 0) return null;
    return new NoDoItem.fromMap(result.first);
  }

  //deletion


  Future<int> deleteItem(int id) async {
    var dbClient = await db;
    return await dbClient.delete(tableName,
        where: "$columnId = ?", whereArgs: [id]);

  }
  Future<int> updateItem(NoDoItem item) async {
    var dbClient = await db;
    return await dbClient.update("$tableName", item.toMap(),
        where: "$columnId = ?", whereArgs: [item.id]);

  }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}