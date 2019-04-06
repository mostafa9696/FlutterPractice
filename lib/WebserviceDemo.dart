import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WebserviceDemo extends StatefulWidget {
  @override
  _ServiceState createState() => new _ServiceState();
}

Future<List> getJson() async{
  String apiUrl = "https://jsonplaceholder.typicode.com/posts";
  http.Response response = await http.get(apiUrl);
  return json.decode(response.body);
}

class _ServiceState extends State<WebserviceDemo> {

  List _data = await getJson() as List;
  print(_data[2]["body"]);

  @override
  Widget build(BuildContext context) {
    //String _data = await getJson();
    return new MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.blueGrey,
          appBar: AppBar(
            title: Text("Webservice"),
            centerTitle: false, // for not center title in ios
          ),

        ));
  }
}
