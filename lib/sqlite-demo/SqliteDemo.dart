import 'package:flutter/material.dart';
import 'package:flutter_app/sqlite-demo/DatabaseHelper.dart';
import 'package:flutter_app/sqlite-demo/User.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';


class SqliteDemo extends StatefulWidget {
  @override
  _DbState createState() => new _DbState();
}

class _DbState extends State<SqliteDemo> {

  var db = DatabaseHelper();
  List users = List();

  void addUser() async {
    users = await db.getAllUser();
    int res = await db.saveUser(User("new-hussien","12334"));
    /*int res = await db.saveUser(User("mostafaa-8","12334"));
    int count = await db.getCount();
    User user = await db.getUser(5);
    user.userName = "mostafa-updated";
    print(count);
    db.updateUser(user);*/
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
            body: ListView.builder(
              itemCount: users.length,
              itemBuilder: (_, int position) {     // _ operator mean that take the same paramter context of build function
                return Card(
                  color: Colors.white30,
                  elevation: 3.0,
                  child: ListTile(
                    title: Text("User: ${User.fromMap(users[position]).userName}"),
                    subtitle: Text("Id: ${User.fromMap(users[position]).id}"),
                  ),
                );
              }),
        ));
  }
}