import 'package:flutter/material.dart';

class _loginData {
  String name;

  String password;

  _loginData() {
    name = "";
    password = "";
  }

}


class LoginScreen extends StatefulWidget {
  @override
  LoginState createState() => new LoginState();
}

class LoginState extends State<LoginScreen> {

  final formKey = GlobalKey<
      FormState>(); // key used to get the form from anyplace
  _loginData _data = _loginData();

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.blueGrey,
          appBar: AppBar(
            title: Text("Login"),
            centerTitle: false, // for not center title in ios
          ),
          body: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset("assets/pics/login.png",
                    width: 90, height: 90,
                    color: Colors.green,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty)
                          return "Please Enter name";
                        else {
                          setState(() {
                            _data.name = value;
                          });
                        }
                      },
                      decoration: InputDecoration(
                          labelText: "Name",
                          border: OutlineInputBorder(
                              gapPadding: 3.3,
                              borderRadius: BorderRadius.circular(3.3)
                          )
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty)
                          return "Please Enter password";
                        else if (value.length < 3)
                          return "password must be long";
                        else {
                          setState(() {
                            _data.password = value;
                          });
                        }
                      },
                      obscureText: true, // not show text
                      decoration: InputDecoration(
                          labelText: "Password",
                          border: OutlineInputBorder(
                              gapPadding: 3.3,
                              borderRadius: BorderRadius.circular(3.3)
                          )
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton(
                            onPressed: () {
                              if (formKey.currentState
                                  .validate()) { // return true if validate is true
                                print("validate true");
                              }
                            },
                            child: Text("Login"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton(
                            onPressed: () {
                              formKey.currentState.reset();
                              setState(() {
                                _data.name = "";
                                _data.password = "";
                              });
                            },
                            child: Text("Clear"),
                          ),
                        )

                      ],
                    ),
                  ),
                  Text(
                      "Welcome ${_data.name} , ${_data.password}"
                  )
                ],
              )),

        ));
  }
}
