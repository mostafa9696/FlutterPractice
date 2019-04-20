
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/inherited_widgets/ChildListWidgets.dart';
import 'package:flutter_app/inherited_widgets/ChildWidgetOne.dart';
import 'package:flutter_app/inherited_widgets/ChildWidgetTwo.dart';
import 'package:flutter_app/inherited_widgets/ChildWidgetThree.dart';
import 'package:flutter_app/inherited_widgets/Item.dart';
import 'package:flutter_app/inherited_widgets/MyInherited.dart';
import 'package:flutter_app/inherited_widgets/MyInheritedWidgetState.dart';

class ParentWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => ParentWidgetSate();

}

class ParentWidgetSate extends State<ParentWidget>{
  @override
  Widget build(BuildContext context) {
    return new MyInheritedWidget(
     myChild: MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text("Inherited widget demo")),
          body: Column(
            children: <Widget>[
              ChildWidgetOne(),
              Container(
                child: Row(children: <Widget>[
                  Icon(Icons.shopping_cart),
                  ChildWidgetTwo(),
                  ChildWidgetThree()
                ],)
              ),
              ChildListWidget()
            ],
          ),
        ),
     ),
    );
  }
}
