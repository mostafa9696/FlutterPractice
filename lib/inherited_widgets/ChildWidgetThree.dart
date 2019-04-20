import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/inherited_widgets/Item.dart';
import 'package:flutter_app/inherited_widgets/MyInherited.dart';
import 'package:flutter_app/inherited_widgets/MyInheritedWidgetState.dart';

class ChildWidgetThree extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Text(" , I am widget without use inherited widget !");
  }

}