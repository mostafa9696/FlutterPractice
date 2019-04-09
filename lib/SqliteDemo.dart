import 'package:flutter/material.dart';
import 'package:flutter_app/DatabaseHelper.dart';
import 'package:flutter_app/User.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';


class SqliteDemo extends StatefulWidget {
  @override
  _DbState createState() => new _DbState();
}

class _DbState extends State<SqliteDemo> {

  var db = DatabaseHelper();

  void addUser() async{
    int res = await db.saveUser(User("mostafa","123"));
    print(res);
    List users = await db.getAllUser();
    for(int i=0 ; i<users.length ; i++){
      User user = User.map(users[i]);
      print(user.userName);
    }
  }

  @override
  Widget build(BuildContext context) {
    addUser();
    return new MaterialApp(
        home: Scaffold(
            //body:

        ));
  }
}