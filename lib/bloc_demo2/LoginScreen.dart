import 'package:flutter/material.dart';
import 'package:flutter_app/bloc_demo2/BlocProvider.dart';
import 'package:flutter_app/bloc_demo2/ValidatorBloc.dart';

class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // with scoped instance bloc
    final scopedBloc = Provider.of(context);
    return MaterialApp(
        home: Scaffold(
          body: Container(
            margin: EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                emailField(scopedBloc),
                passField(scopedBloc),
                Container(
                  margin: EdgeInsets.only(top: 20),
                ),
                submitButton()
              ],
            ),
          ),
        ),
      );
   // );

    // with singla instance block
    /*
    return MaterialApp(
      home: Scaffold(
        body: Container(
          margin: EdgeInsets.all(12.0),
          child: Column(
            children: <Widget>[
              emailField(),
              passField(),
              Container(
                margin: EdgeInsets.only(top: 20),
              ),
              submitButton()
            ],
          ),
        ),
      ),
    );*/
  }

  Widget emailField(ValidatorBloc scopedBloc) {
    return StreamBuilder(
      //stream: myBloc.email,     // with global bloc
      stream: scopedBloc.email,   // with one instance block(scoped)
      builder: (context, snapshot) {
        return TextField(
          onChanged: (input) {
            // equivalent to => onChanged : myBloc.changeEmail
            //myBloc.changeEmail(input);
             scopedBloc.changeEmail(input);
          },
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              labelText: 'Enter email address',
              hintText: 'you@example.com',
              errorText: snapshot.error),
        );
      },
    );
  }

  Widget passField(ValidatorBloc scopedBloc) {
    return StreamBuilder(
      //stream: myBloc.pass,
      stream: scopedBloc.pass,
      builder: (context, snapshot) {
        return TextField(
          //onChanged: myBloc.changePass,
          onChanged: scopedBloc.changePass,
          decoration:
              InputDecoration(
                  labelText: 'password',
                  hintText: 'password',
                  errorText: snapshot.error
              ),
        );
      },
    );
  }

  submitButton() {
    return RaisedButton(
      child: Text('login'),
      color: Colors.blue,
      onPressed: () {},
    );
  }
}
