import 'dart:io';

import 'package:flutter/material.dart';
import 'package:device_info/device_info.dart';
import 'MyAppTwo.dart';
import 'LoginScreen.dart';
import 'WeightPlanet.dart';


void main() {
  runApp(new WeightPlanet());
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
      ], onTap: (int pos) => {

      },),
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

  var snackbar = SnackBar(
    content: Text("This is snackbar"),
    duration: Duration(seconds: 1),
    backgroundColor: Colors.lightGreen,
    action: SnackBarAction(label: "OK", onPressed: () {}),
  );

  var scaffoldKey = GlobalKey<ScaffoldState>();

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
          title: Text(
            " تدريب فلاتر",
            style: TextStyle(fontFamily: "Tajwal"),
          ),
          elevation: 8.0,
          actions: <Widget>[Icon(Icons.add),
          Icon(Icons.search),
          IconButton(icon: Icon(Icons.navigation), onPressed: ()=> debugPrint("Nav pressed!"),)
          ],
        ),
        body: Builder(
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
                    onPressed: () {
                      Scaffold.of(scaffoldContext).showSnackBar(snackbar);
                    },
                    child: Text("show snackbar"),
                  ),
                  RaisedButton(
                    onPressed: getSnackbar,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: Colors.black, width: 4)),
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
            child: Icon(Icons.navigation)));
  }
}

class MyAppSixPageTwo extends StatelessWidget {
  void navigateToPageTwo(BuildContext context) {
    Navigator.pushNamed(context, "/PageThree");
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () => navigateToPageTwo(context),
          child: Icon(Icons.navigate_next)),
      body: Center(
        child: Text("New Page two.."),
      ),
    );
  }
}

class MyAppSixPageThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: Text("New Page three.."),
      ),
    );
  }
}

///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////

class MyAppSeven extends StatefulWidget {
  @override
  _MyStateSix createState() => new _MyStateSix();
}

class _MyStateSix extends State<MyAppSeven>
    with SingleTickerProviderStateMixin {

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
    var items = [
      "1",
      "2",
      "3",
      "4",
      "5",
      "6",
      "7",
      "8",
      "9",
      "10",
      "11",
      "12"
    ];

    var myList = List.generate(50, (i) => "Flutter $i");
    var listViewControler = ScrollController();
    Container getCircleAvatar() {
      return Container(
        height: 100,
        child: CircleAvatar(
          radius: 50,
          backgroundColor: Colors.greenAccent,
          child: Text("user 11"),
          backgroundImage: NetworkImage(
              "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50"),
        ),
      );
    }

    return new MaterialApp(
        home: Scaffold(
            floatingActionButton: FloatingActionButton(
                child: Icon(Icons.arrow_upward),
                onPressed: () {
                  listViewControler.animateTo(0.0,
                      duration: Duration(seconds: 2),
                      curve: Curves.bounceInOut);
                }),
            bottomNavigationBar: Material(
              color: Colors.blue,
              child: TabBar(controller: tabController, tabs: [
                Icon(
                  Icons.refresh,
                  size: 25,
                ),
                Icon(Icons.textsms),
                Icon(Icons.people_outline)
              ]),
            ),
            appBar: AppBar(
                title: Text("Flutter practice"),
                bottom: TabBar(
                  controller: tabController,
                  tabs: [
                    Icon(Icons.add_a_photo),
                    Icon(Icons.add_alarm),
                    Icon(Icons.add_call)
                  ],
                  indicatorColor: Colors.black45,
                )),
            body: TabBarView(
              controller: tabController,
              children: [

                Container(
                  color: Colors.red,
                  child: ListView(
                    controller: listViewControler,
                    children: myList.map((item) {
                      return Dismissible(
                          onDismissed: (direction) {
                            setState(() {
                              myList.removeAt(myList.indexOf(item));
                            });
                          },
                          child: ListTile(
                            leading: FlutterLogo(),
                            title: Text(item),
                          ),
                          key: Key(item));
                    }).toList(),
                  ),
                ),


                Container(
                  color: Colors.greenAccent,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      getCircleAvatar(),
                      SizedBox(
                        width: 10,
                      ),
                      getCircleAvatar(),
                      SizedBox(
                        width: 10,
                      ),
                      getCircleAvatar(),
                      SizedBox(
                        width: 10,
                      ),
                      getCircleAvatar(),
                      getCircleAvatar(),
                      SizedBox(
                        width: 10,
                      ),
                      getCircleAvatar(),
                      SizedBox(
                        width: 10,
                      ),
                      getCircleAvatar(),
                      SizedBox(
                        width: 10,
                      ),
                      getCircleAvatar()
                    ],
                  ),
                ),


                Container(
                    color: Colors.purple,
                    child: ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return Dismissible(
                          background: Container(color: Colors.red, child: Icon(Icons.delete_forever),),
                          onDismissed: (direction) {
                            setState(() {
                              items.removeAt(index);
                            });
                          },
                            child : Card(
                              child: Container(
                            height: 100,
                            child: Center(
                              child: Text(items[index]),
                            ),
                          ))
                          ,key: Key(items[index]),
                          );
                        })),
              ],
            )));
  }
}


///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////


class MyAppEight extends StatefulWidget {
  @override
  _MyStateSeven createState() => new _MyStateSeven();
}

class _MyStateSeven extends State<MyAppEight> {

  String imageUrl = "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50";
  String imageUrl2 = "https://www.gstatic.com/webp/gallery/2.jpg";
  String imageUrl3 = "https://www.gstatic.com/webp/gallery/5.jpg";

  ListTile getListItem(BuildContext scaffoldContext, String url, String text){
    return ListTile(
      title: Text(text),
      leading: InkWell(
        onTap: (){
          Navigator.push(scaffoldContext, MaterialPageRoute(builder: (BuildContext context){
            return AnotherPage(imageUrl: url, tag: "test anim$text");
          }));
        },
        child: Hero(
          tag: "test anim$text",
          child: Container(
            width: 50,height: 50,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(url))
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: Scaffold(
          body:Builder(
        builder: (scaffoldContext) =>  ListView(children: <Widget>[
          getListItem(scaffoldContext, imageUrl, "mostafa 1"),
          getListItem(scaffoldContext, imageUrl, "mostafa 2"),
          getListItem(scaffoldContext, imageUrl2, "mostafa 3"),
          getListItem(scaffoldContext, imageUrl, "mostafa 4"),
          getListItem(scaffoldContext, imageUrl3, "mostafa 5"),
          getListItem(scaffoldContext, imageUrl2, "mostafa 6"),

        ],),

        )));
  }
}

class AnotherPage extends StatelessWidget{
  final String imageUrl;
  final String tag;

  const AnotherPage({Key key, this.imageUrl, this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag:tag,
        child: Center(
          child: Container(
            child: Image.network(imageUrl),),
        ))
    );
  }

}


///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////


class MyApp9 extends StatefulWidget {
  @override
  _MyState8 createState() => new _MyState8();
}

class _MyState8 extends State<MyApp9> {

  double sliderValue = 1.0;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.greenAccent,
            appBar: AppBar(
              title: Slider(
                  min: 1,max: 4,
                  activeColor: Colors.red, value:sliderValue,
                  onChanged: (double value){
                    setState(() {
                      sliderValue = value;
                    });
                  }),),
            body: GridView.count(crossAxisSpacing: 10,
              crossAxisCount: sliderValue.toInt(), children: <Widget>[
                Container(color: Colors.deepPurpleAccent,height: 200.0, width: 400,child: Stack( children: <Widget>[
                  Container(color: Colors.blue, height: 50.0, width: 100),
                  Container(alignment: Alignment.bottomLeft, color: Colors.yellow, height: 100.0, width: 150),
                  Center(child: Container(color: Colors.red, height: 50.0, width: 100)),
                ],
                ),),
              Card(child: Center(child: Text("Data"),),),
              Card(child: Center(child: Text("Data 1"),),),
              Card(child: Center(child: Text("Data 2"),),),
              Card(child: Center(child: Text("Data 3"),),),
              Card(child: Center(child: Text("Data 4"),),),
              Card(child: Center(child: Text("Data 5"),),),
              Card(child: Center(child: Text("Data 6"),),),
              Card(child: Center(child: Text("Data 7"),),),
              Card(child: Center(child: Text("Data 8"),),)
            ],)

            ));
  }
}

///////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////


class MyApp10 extends StatefulWidget {
  @override
  _MyState9 createState() => new _MyState9();
}

class _MyState9 extends State<MyApp10> {


  @override
  Widget build(BuildContext context) {
    return new MaterialApp(

        home: Scaffold(
          body: CustomScrollView(
            reverse: true,
            slivers: <Widget>[
              MyAppbar(),
              MyAppbar(),
              MyAppbar(),
              MyAppbar(),
              SliverFillRemaining(
                child: Container(color: Colors.greenAccent,),
              )

              /*
               *  for expanded appbar
              SliverFixedExtentList(
               itemExtent: 250.0,     // height of each item
               delegate: SliverChildListDelegate([
                Card(color: Colors.red,),
                Card(color: Colors.greenAccent,),
                Card(color: Colors.grey,),
                Card(color: Colors.black38,),
                Card(color: Colors.blue,),
                Card(color: Colors.lightBlueAccent,),
                Card(color: Colors.yellow,)
               ]),
              )*/
            ],
          ),


        ));
  }
}

class MyAppbar extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        pinned: true,   // hide toolbar when scroll up
        expandedHeight: 200.0,
        flexibleSpace: FlexibleSpaceBar(
        title: Text("Flutter demo"),
    background: Image.network(
    "https://www.gstatic.com/webp/gallery/5.jpg",
    fit: BoxFit.cover,),
    ));
  }

}

