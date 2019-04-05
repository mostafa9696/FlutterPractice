import 'package:flutter/material.dart';

class MyAppTwo extends StatefulWidget {
  @override
  _MyState createState() => new _MyState();
}

class _MyState extends State<MyAppTwo> {
  List<String> langs = ["kotlin", "dart", "java", "c++"];
  var currentLang = "Choose Lang";
  var currentIndex = 0;
  var textSize = 15.0;
  var myStyle = TextStyle(fontSize: 15.0);

  void getLang() {
    setState(() {
      currentLang = langs[currentIndex];
    });
    currentIndex = (currentIndex >= langs.length - 1) ? 0 : ++currentIndex;
  }

  void incSize() {
    setState(() {
      textSize++;
      myStyle = TextStyle(fontSize: textSize);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: Scaffold(
          body: Material(
            color: Colors.redAccent,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  InkWell(
                    // InkWell used to add onTap property to icon
                      onTap: incSize,
                      child: Icon(
                        Icons.add,
                        size: 30,
                      )),
                  Text(
                    currentLang,
                    style: myStyle,
                  ),
                  RaisedButton(
                    onPressed: getLang,
                    child: Text(
                      "Chang language:",
                      style: myStyle,

                    ),
                    color: Colors.green,
                  ),
                  GestureDetector(
                  onTap: () => debugPrint("View is clicked !"),
                  child:Container(
                    color: Colors.orange,
                    alignment: Alignment.bottomLeft,
                    child: Text("text container"),
                  )),
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            color: Colors.grey,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "Copyright!",
                    style: myStyle,
                  ),
                  Icon(Icons.copyright),
                  Text("2018", style: myStyle)
                ],
              ),
            ),
          ),
          appBar: AppBar(title: Text("Random App")),
        ));
  }
}
