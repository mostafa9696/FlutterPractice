import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WeatherDemo extends StatefulWidget {
  @override
  _WeatherState createState() => new _WeatherState();

}

class _WeatherState extends State<WeatherDemo> {

  final String API_KEY = "5b5c71b7abbd78994077b261eea45fe9";
  String _inpCity;

  @override
  void initState(){
    super.initState();
    _loadSavedCity();
    print("in initState");
  }

  void _loadSavedCity() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      _inpCity = pref.getString("city") ?? "Cairo";
      /**
       * if pref.get city key is not exist so it will return cairo => same as if(pref.getString("city")!=null)
       */
    });
  }

  Future<Map> getWeather(String city) async {
    String apiUrl =
        'http://api.openweathermap.org/data/2.5/weather?q=$city&appid='
        '${API_KEY}&units=imperial';

    http.Response response = await http.get(apiUrl);
    return json.decode(response.body);
  }

  Future navigateToCityScreen(BuildContext context) async {
    // make it future becaue it may second screen return result
    Map results = await Navigator.of(context)
        .push(MaterialPageRoute<Map>(builder: (BuildContext context) {
      return new CityScreen();
    }));

    if (results != null && results.containsKey('city')) {
      setState(() {
        _inpCity = results['city'];
      });
    }
  }

  Widget updateTempWidget(String city) {
    return FutureBuilder(
      //future: getWeather(city==null ? "london" : city),
      future: getWeather(city),
      builder: (BuildContext context, AsyncSnapshot<Map> snapShot) {
        if (snapShot.hasData) {
          Map content = snapShot.data;
          print(content['main']['temp']);
          return Container(
            margin: const EdgeInsets.fromLTRB(30.0, 250.0, 0.0, 0.0),
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text(
                    content['main']['temp'].toString(),
                    style: getTempTextStyle(),
                  ),
                  subtitle: ListTile(
                    title: Text(
                      "Min Temperature: ${content['main']['temp_min'].toString()}\n"
                      "Max Temperature: ${content['main']['temp_max'].toString()}"
                      ,style: TextStyle(color: Colors.white),

                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  TextStyle getTextStyle() {
    return TextStyle(
        color: Colors.white, fontSize: 21.0, fontStyle: FontStyle.italic);
  }

  TextStyle getTempTextStyle() {
    return TextStyle(
        color: Colors.white,
        fontSize: 48.0,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500);
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: Scaffold(
                appBar: AppBar(
                  title: Text("Weather Demo"),
                ),
                body: Builder(builder: (context2)=> Stack(
                  children: <Widget>[
                    Center(
                      child: Image.asset(
                        "assets/pics/umbrella.png",
                        width: 490,
                        height: 1200,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                        alignment: Alignment.topRight,
                        margin: const EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 0.0),
                        child: Text(
                          _inpCity,
                          style: getTextStyle(),
                        )),
                    Container(
                      alignment: Alignment.center,
                      child: Image.asset("assets/pics/light_rain.png"),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                        child: FlatButton(
                            onPressed: (){
                              navigateToCityScreen(context2);
                            },
                            child: Text("Enter City"),
                            color: Colors.blueAccent,
                            textColor: Colors.white),
                    ),
                    updateTempWidget(_inpCity)
                  ],
                ))));
  }
}

class CityScreen extends StatelessWidget {
  var _cityController = TextEditingController();

  void saveAndNavigate(BuildContext context) async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    String city = pref.getString("city") ?? "Cairo";
    await pref.setString("city", _cityController.text);
    Navigator.pop(context,{
      'city': _cityController.text
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose City"),
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: Image.asset(
              "assets/pics/white_snow.png",
              width: 500,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: TextField(
              decoration: InputDecoration(hintText: "Enter city"),
              controller: _cityController,
              keyboardType: TextInputType.text,
            ),
          ),
          Container(
              margin: const EdgeInsets.fromLTRB(0, 70, 0, 0),
              child: FlatButton(
                  onPressed: () {
                    saveAndNavigate(context);
                  },
                  child: Text("Get weather"),
                  color: Colors.blueAccent,
                  textColor: Colors.white)),
        ],
      ),
    );
  }
}
