import 'dart:io';

import 'package:flutter/material.dart';
import 'package:device_info/device_info.dart';

void main() {
  runApp(new MyAppSeven());
    /*runApp(new MaterialApp(
      routes: <String, WidgetBuilder>{
        "/PageTwo":(BuildContext context) => MyAppSixPageTwo(),
        "/PageThree":(BuildContext context) => MyAppSixPageThree(),
      },
      home: MyAppSix(),
    ));
    */
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
            backgroundColor: Colors.lightGreen,
            title: Row(
              children: <Widget>[Icon(Icons.home), Text("Card List")],
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Card(
                child: Row(
                  children: <Widget>[
                    Icon(Icons.access_time),
                    Text("First Item")
                  ],
                ),
              ),
              // refactoring
              myCustomCard("Second Item", Icons.add_a_photo),
              myCustomCard("Third Item", Icons.access_alarm),
              myCustomCard("Fourth Item", Icons.account_balance_wallet),
            ],
          )),
    );
  }
}

Card myCustomCard(String cardText, IconData cardIcon) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            cardIcon,
            color: Colors.blueGrey,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              cardText,
              style: TextStyle(fontSize: 22, color: Colors.red),
            ),
          ),
        ],
      ),
    ),
  );
}

//////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////

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
      body: Center(
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
                "Chang language",
                style: myStyle,
              ),
              color: Colors.green,
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey,
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                "Copyright",
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

//////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////

class MyAppThree extends StatefulWidget {
  @override
  _MyStateTow createState() => new _MyStateTow();
}

class _MyStateTow extends State<MyAppThree> {
  String myDeviceInfo = "";

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
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: getDeviceInfo,
              child: Text("Get device info"),
            ),
            Text(myDeviceInfo)
          ],
        ),
      ),
    )));
  }
}

//////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////

class MyAppFour extends StatefulWidget {
  @override
  _MyStateFour createState() => new _MyStateFour();
}

class _MyStateFour extends State<MyAppFour> {
  final userNameController = TextEditingController();
  var userName = "";
  String txt;

  void onEditClick() {
    setState(() {
      userName = userNameController.text;
    });
  }

  void onEditTextChanged(te) {
    setState(() {
      userName = userNameController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: Scaffold(
      drawer: Drawer(
        child: ListView(
          // use endDrawer instead of drawer in arabic mode
          children: <Widget>[
            DrawerHeader(
              child: Text("Drawer Header"),
            ),
            ListTile(
              onTap: () {},
              title: Text("Item One"),
              subtitle: Text("Item One subtitle"),
              leading: Icon(Icons.info),
              selected: true,
            ),
            ListTile(
              onTap: () {},
              title: Text("Item Two"),
              trailing: Switch(value: true, onChanged: null),
              leading: Icon(Icons.switch_camera),
            ),
            ListTile(
              onTap: () {},
              title: Text("Item Three"),
              leading: Icon(
                Icons.local_car_wash,
                color: Colors.red,
              ),
            ),
            AboutListTile(
              child: Text("This is navigation drawer"),
            )
          ],
        ),
      ),
      backgroundColor: Colors.greenAccent,
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.delete),
      ),
      bottomNavigationBar: BottomNavigationBar(items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.refresh), title: Text("Refresh")),
        BottomNavigationBarItem(
            icon: Icon(Icons.add_a_photo), title: Text("Add")),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite), title: Text("favorite")),
      ]),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Card(
              child: Container(
                height: 150,
                child: TextField(
                  controller: TextEditingController(),
                ),
              ),
            ),
            Card(
              child: Container(
                height: 150,
                child: FloatingActionButton(
                    backgroundColor: Colors.red, onPressed: null),
              ),
            ),
            Card(
                child: Column(
              children: <Widget>[
                TextField(
                  controller: userNameController,
                  onChanged: (txt) {
                    setState(() {
                      userName = userNameController.text;
                    });
                  },
                ),
                InkWell(
                  child: Icon(Icons.edit),
                  onTap: onEditClick,
                ),
                Text("Hello ${userName}")
              ],
            )),
            Card(
              child: Container(
                height: 150,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

//////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////

class MyAppFive extends StatefulWidget {
  @override
  _MyStateFive createState() => new _MyStateFive();
}

class _MyStateFive extends State<MyAppFive> {
  var testTheme =
      ThemeData(brightness: Brightness.dark, buttonColor: Colors.green);

  var snackbar = SnackBar(content:
    Text("This is snackbar"),
    duration: Duration(seconds: 1),
    backgroundColor: Colors.lightGreen,
    action: SnackBarAction(label: "OK", onPressed: (){}),
  );

  var scaffoldKey =  GlobalKey<ScaffoldState>();

  getSnackbar() {
    print("test");
    scaffoldKey.currentState.showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Theme(
        data: testTheme,
        child: Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            centerTitle: true,
            leading: Icon(Icons.home),
            title: Text(" تدريب فلاتر", style: TextStyle(fontFamily: "Tajwal"),),
            elevation: 8.0,
            actions: <Widget>[Icon(Icons.add), Icon(Icons.search)],
          ),
          body:
          Builder(
            builder: (scaffoldContext) => Column(
            children: <Widget>[
              Container(
                child: Image.asset(
                  "assets/pics/user.png",
                  height: 100,
                  width: 100,
                ),
              ),
              Container(
                child: Image.network(
                  "http://quran.gplanet.tech/hafs/images/1.png",
                  height: 300,
                  width: 300,
                ),
              ),
              RaisedButton(
                onPressed: (){
                  Scaffold.of(scaffoldContext).showSnackBar(snackbar);
                },
                child: Text("show snackbar"),
              ),
              RaisedButton(
                onPressed: getSnackbar,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(color: Colors.black, width: 4)
                  ),
                child: Text("show snackbar global key"),
              )
            ],
          ),
        ),
      ),
    ));
  }
}

///////////////////////////////////////////
///////////////////////////////////////////

class MyAppSix extends StatelessWidget {

  void navigateToPageTwo(BuildContext context) {
   Navigator.pushNamed(context, "/PageTwo");
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () => navigateToPageTwo(context),
            child: Icon(Icons.navigation))
    );
  }
}

class MyAppSixPageTwo extends StatelessWidget {

  void navigateToPageTwo(BuildContext context) {
    Navigator.pushNamed(context, "/PageThree");
  }

  @override
  Widget build(BuildContext context) {
    return new  Scaffold(
          floatingActionButton: FloatingActionButton(
              onPressed: () => navigateToPageTwo(context),
              child: Icon(Icons.navigate_next)),
        body: Center(child: Text("New Page two.."),),
    );
  }
}

class MyAppSixPageThree extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return  new Scaffold(
        body: Center(child: Text("New Page three.."),),
      );
  }
}

///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////

class MyAppSeven extends StatefulWidget  {


  @override
  _MyStateSix createState() => new _MyStateSix();
}

class _MyStateSix extends State<MyAppSeven> with SingleTickerProviderStateMixin{

  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: Scaffold(
            bottomNavigationBar: Material(color: Colors.blue
              ,child: TabBar(controller: tabController, tabs: [Icon(Icons.refresh, size: 25,), Icon(Icons.textsms), Icon(Icons.people_outline)]),),
            appBar: AppBar(title: Text("Flutter practice")
                    ,bottom: TabBar(controller: tabController,
                  tabs: [Icon(Icons.add_a_photo), Icon(Icons.add_alarm), Icon(Icons.add_call)], indicatorColor: Colors.black45,)),
            body: TabBarView(controller: tabController, children: [
                Container(color: Colors.red),
                Container(color: Colors.greenAccent),
                Container(color: Colors.purple),
              ],
            )
        ));
  }




}

