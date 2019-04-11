import 'package:flutter/material.dart';


class WeightPlanet extends StatefulWidget {
  @override
  _PlanetState createState() => new _PlanetState();
}

class _PlanetState extends State<WeightPlanet> {

  int radioValue = 0;
  final TextEditingController _controller = TextEditingController();
  double _result = 0.0;
  String weightResult = "";

  void onRadioChanged(int value) {
    setState(() {
      radioValue = value;
      switch(value){
        case 0:
          _result = int.parse(_controller.text) * 0.06 ;
          weightResult = "Your weigh on Pluto is ${_result.toStringAsFixed(1)}";
          break;
        case 1:
          _result = int.parse(_controller.text) * 0.38 ;
          weightResult = "Your weigh on Mars is ${_result.toStringAsFixed(1)}";

          break;
        case 2:
          _result = int.parse(_controller.text) * 0.91 ;
          weightResult = "Your weigh on Venus is ${_result.toStringAsFixed(1)}";

          break;

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.lightGreen,
          appBar: AppBar(
            title: Text("Weight on planet X"),
            backgroundColor: Colors.black26,
          ),
          body: Container(
            alignment: Alignment.topCenter,
            child: ListView(
              padding: const EdgeInsets.all(2.5),
              children: <Widget>[
                Image.asset("assets/pics/planet.png", height: 150, width: 200,)
                ,Container(
                  margin: const EdgeInsets.all(5.0),
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: _controller,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Your weight on earth",
                          hintText: "In pound",
                          icon: Icon(Icons.person,)
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(28.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Radio<int>(value: 0, groupValue: radioValue, onChanged: onRadioChanged,activeColor: Colors.orangeAccent, ),
                            Text("Pluto", style: TextStyle(color: Colors.white30),),
                            Radio<int>(value: 1, groupValue: radioValue, onChanged: onRadioChanged, activeColor: Colors.orangeAccent,),
                            Text("Mars", style: TextStyle(color: Colors.white30),),
                            Radio<int>(value: 2, groupValue: radioValue, onChanged: onRadioChanged, activeColor: Colors.orangeAccent,),
                            Text("Venus", style: TextStyle(color: Colors.white30),),
                          ],
                        ),
                      ),
                      Text(weightResult)
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}