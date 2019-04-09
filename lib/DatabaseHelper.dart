import 'dart:async';
import 'dart:io';

import 'package:flutter_app/User.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';


class DatabaseHelper {

  static final DatabaseHelper _instance =new DatabaseHelper.internal(); // internal refer to internal constructor
  static Database _db;
  final String tableUser = "userTable";
  final String columnId = "id";
  final String columnUsername = "username";
  final String columnPassword = "password";

  //A factory constructor is permitted to return an existing instance
  factory DatabaseHelper()=> _instance;

  DatabaseHelper.internal();

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
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "userdb.db"); // join append '/'
    var myDb = await openDatabase(path, version: 1, onCreate: _onDbCreate);
    return myDb;
  }

  void _onDbCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $tableUser($columnId INTEGER PRIMARY KEY, $columnUsername TEXT, $columnPassword TEXT)"
    );
  }

  // CRUD operations

  Future<int> saveUser(User user) async {
    var dbClient = await db;
    int res = await dbClient.insert(tableUser, user.toMap());
    return res;
  }

  Future<List> getAllUser() async {
    var dbClient = await db;
    var res = await dbClient.rawQuery("select * from $tableUser");
    return res.toList();
  }

  Future<int> getCount() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery("select count(*) from $tableUser")
    );
  }

  Future<User> getUser(int userId) async{
    var dbClient = await db;
    var res = await dbClient.rawQuery(
        "select * from $tableUser where $columnId = $userId");
    if(res.length ==0)
      return null;
    else
      return new User.fromMap(res.first);
  }

  Future<int> deleteUser(int userId) async {
    var dbClient = await db;
    return await dbClient.delete(tableUser,
        where:"$columnId = ?", whereArgs: [userId]);
  }

  Future<int> updateUser(User user ) async {
    var dbClient = await db;
    return await dbClient.update(tableUser, user.toMap(),
                  where: "$columnId = ?", whereArgs: [user.id]);
  }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}