import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';



class WeatherDemo extends StatefulWidget {
  @override
  _WeatherState createState() => new _WeatherState();
}

class _WeatherState extends State<WeatherDemo> {


  void openCityScreen(){

  }

  TextStyle getTextStyle(){
    return TextStyle(color: Colors.white, fontSize: 21.0, fontStyle: FontStyle.italic);
  }

  TextStyle getTempTextStyle(){
    return TextStyle(color: Colors.white, fontSize: 48.0, fontStyle: FontStyle.normal, fontWeight: FontWeight.w500);
  }

  @override
  Widget build(BuildContext context) {
    final String API_KEY = "5b5c71b7abbd78994077b261eea45fe9";

    Future<Map> getWeather(String city) async{

      String apiUrl =
          'http://api.openweathermap.org/data/2.5/weather?q=$city&appid='
          '${API_KEY}&units=imperial';

      http.Response response = await http.get(apiUrl);
      return json.decode(response.body);
    }

    return new MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text("Weather Demo"), actions: <Widget>[
              IconButton(icon: Icon(Icons.location_city), onPressed: openCityScreen)
            ],),
           body: Stack(
            children: <Widget>[
              Center(child:Image.asset("assets/pics/umbrella.png",width: 490, height: 1200, fit: BoxFit.fill,),),
              Container(
                  alignment: Alignment.topRight,
                  margin: const EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 0.0),
                  child: Text("Cairo", style: getTextStyle(),)
              ),
              Container(
                alignment: Alignment.center,
                child: Image.asset("assets/pics/light_rain.png"),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(30, 250, 0, 0),
                child: Text("67.8F", style: getTempTextStyle(),),
              )
            ],
           )
            ));
  }



}
