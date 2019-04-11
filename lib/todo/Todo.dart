import 'package:flutter_app/SqliteDemo.dart';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/todo/NoDoItem.dart';
import 'package:flutter_app/todo/TodoDBHelper.dart';


class TodoApp extends StatefulWidget {
  @override
  _TodoState createState() => new _TodoState();
}

class _TodoState extends State<TodoApp> {

  TodoDBHelper db = TodoDBHelper();
  var textEditContoroller = TextEditingController();
  List<NoDoItem> itemList = <NoDoItem>[];

  submitNote(String text) {

  }


  @override
  void initState() {
    super.initState();
    _readList();
  }

  void _readList() async {

    List items = await db.getItems();
    print(items.length);
    items.forEach((item){
      NoDoItem noDoItem = NoDoItem.fromMap(item);
      setState(() {
        itemList.add(noDoItem);
      });
      print(noDoItem.itemName);
    });

  }

  void _showAddDialog(BuildContext context) async {
    int count = await db.getCount();
    NoDoItem item = NoDoItem("item $count", DateTime.now().toIso8601String());
    int savedItemId = await db.saveItem(item);
    NoDoItem addedItem = await db.getItem(savedItemId);
    setState(() {
      itemList.add(item);
    });
    /*var alert = AlertDialog(
        content: Row(children: <Widget>[
          Expanded(
              child: TextField(
                controller: textEditContoroller,
                autofocus: true,
                decoration: InputDecoration(
                    labelText: "Item",
                    hintText: "Enter todo title",
                    icon: Icon(Icons.note_add)
                ),
              )
          )
        ],
        ),
        actions: <Widget>[
      submitNote(textEditContoroller.text);
      FlatButton(onPressed: () {
      textEditContoroller.clear();
      }, child: Text("Save"),),
        
        FlatButton(onPressed: () => Navigator.pop(context), child:Text("Cancel") , )
    ]
    ,
    );
    showDialog(context: context, builder:(context){
        return alert;
    });*/

  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp (
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text("Todo"),
            backgroundColor: Colors.greenAccent,
          ),
          floatingActionButton: FloatingActionButton(onPressed:()=> _showAddDialog(context)
            , child: Icon(Icons.add),
            backgroundColor: Colors.lightGreen,
          ),
          body: ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: itemList.length,
              itemBuilder: (_, int index){
                return Card(
                  color: Colors.white10,
                  child: ListTile(
                    title: itemList[index],         // put widget in NoDoItem class to ListTile of listview
                    trailing: Listener(
                      key: Key(itemList[index].itemName),
                      child: Icon(Icons.remove_circle, color: Colors.red,),
                    ),
                  ),
                );
          })
        ));
  }


}
