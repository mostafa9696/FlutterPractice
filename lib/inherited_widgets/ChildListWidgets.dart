import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/inherited_widgets/Item.dart';
import 'package:flutter_app/inherited_widgets/MyInheritedWidgetState.dart';

class ChildListWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    final MyInheritedWidgetState state = MyInheritedWidget.of(context);
    List<Item>items = state.items;
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Container(
        color: Colors.lightBlue,
        height: 400,
        child: ListView.builder (
            itemCount: items.length,
            itemBuilder: (context, index){
              return  Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Center(child: Text(items[index].cart)),
              );
            }),
      ),
    );
  }

}