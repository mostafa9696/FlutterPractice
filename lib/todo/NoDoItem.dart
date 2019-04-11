import 'dart:io';
import 'package:flutter/material.dart';

class NoDoItem extends StatelessWidget {

  String _itemName;
  String _dataCreated;
  int _id;

  NoDoItem.map(dynamic obj){    // dynamic value can be of any type
    this._itemName = obj['itemName'];
    this._dataCreated = obj['dateCreated'];
    this._id = obj['id'];
  }

  NoDoItem.fromMap(Map<String, dynamic> map){
    this._itemName = map['itemName'];
    this._dataCreated = map['dateCreated'];
    this._id = map['id'];
  }

  Map<String, dynamic> toMap(){
    var map = Map<String, dynamic>();
    map["itemName"] = this._itemName;
    map["dateCreated"] = this._dataCreated;
    if(_id != null) {
      map["id"] = this._id;
    }
    return map;
  }


  String get itemName => _itemName;

  set itemName(String value) {
    _itemName = value;
  }

  NoDoItem(this._itemName, this._dataCreated);

  String get dataCreated => _dataCreated;

  set dataCreated(String value) {
    _dataCreated = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(_itemName, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17.0),),
          Container(
          margin: const EdgeInsets.only(top: 5.0),
          child: Text("Created on $dataCreated", style: TextStyle(color:  Colors.white70, fontSize: 12.5, fontStyle:  FontStyle.italic)),
        )
        ],
      ),

    );
  }

}