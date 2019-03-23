import 'dart:io';

import 'package:flutter/material.dart';
import 'package:device_info/device_info.dart';

void main() {
  runApp(new MyAppThree());
}

class MyAppOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
          /*appBar: new AppBar(
            title: Text("Flutter Demo"),
          ),*/
          appBar: new AppBar(
            title: Row(
              children: <Widget>[
                Icon(Icons.home),
                Text("Card List")
              ],
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Card(
                child: Row( children: <Widget>[
                  Icon(Icons.access_time),
                  Text("First Item")
                ],),
              ),
              // refactoring
              myCustomCard("Second Item", Icons.add_a_photo),
              myCustomCard("Third Item", Icons.access_alarm),
              myCustomCard("Fourth Item", Icons.account_balance_wallet),
            ],
          )
      ),
    );
  }
}

Card myCustomCard(String cardText, IconData cardIcon){
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(cardIcon, color: Colors.blueGrey,),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(cardText,
                style: TextStyle(fontSize: 22,
                    color: Colors.red),
            ),
          ),
        ],
      ),
    ),
  );
}

//////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////


 class MyAppTwo extends StatefulWidget{
  @override
  _MyState createState() => new _MyState();
 }

 class _MyState extends State<MyAppTwo>{
  List<String> langs = ["kotlin","dart","java","c++"];
  var currentLang = "Choose Lang";
  var currentIndex = 0;
  var textSize = 15.0;
  var myStyle = TextStyle(fontSize: 15.0);

  void getLang() {
    setState(() {
      currentLang = langs[currentIndex];
    });
    currentIndex = (currentIndex >= langs.length-1) ? 0 : ++currentIndex;
  }

  void incSize(){
    setState(() {
      textSize++;
      myStyle = TextStyle(fontSize: textSize);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: Scaffold(
          body: Center(
            child: Column(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: <Widget>[
              InkWell(        // InkWell used to add onTap property to icon
                  onTap: incSize,
                  child: Icon(Icons.add, size: 30, )),
              Text(currentLang, style: myStyle,),
              RaisedButton(onPressed: getLang ,
                child: Text("Chang language", style: myStyle,),
                color: Colors.green,)
            ],),
          ),
          bottomNavigationBar: BottomAppBar(
            color: Colors.grey,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text("Copyright", style: myStyle,),
                  Icon(Icons.copyright),
                  Text("2018", style: myStyle)
                ],
              ),
            ),
          ),
          appBar: AppBar(title: Text("Random App")),
        )
    );
  }
 }

//////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////

class MyAppThree extends StatefulWidget{
  @override
  _MyStateTow createState() => new _MyStateTow();
}

class _MyStateTow extends State<MyAppThree>{

  String myDeviceInfo="";

  getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    var brand = "default";
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      brand = androidInfo.brand;
    }
    setState(() {
      myDeviceInfo = brand;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Center(
              child: Column(children: <Widget>[
                RaisedButton(onPressed: getDeviceInfo,
                  child: Text("Get device info"),
                ),
                Text(myDeviceInfo)
              ],),
            ),
          )
    ));
  }
}