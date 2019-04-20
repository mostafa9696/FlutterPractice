import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/inherited_widgets/Item.dart';
import 'package:flutter_app/inherited_widgets/MyInherited.dart';
import 'package:flutter_app/inherited_widgets/MyInheritedWidgetState.dart';

class ChildWidgetOne extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    final MyInheritedWidgetState state = MyInheritedWidget.of(context);
    return Container(
      child: RaisedButton (
          child: Text('Add item'),
          onPressed: () {
            state.addItem("Item");
            state.increseNum();
          }
      ),
    );
  }

}