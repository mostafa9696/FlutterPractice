import 'package:flutter/material.dart';
import 'package:flutter_app/bloc_demo2/ValidatorBloc.dart';

// create bloc provider to make scoped bloc and not general(one instance)

class Provider extends InheritedWidget{

  final ValidatorBloc bloc = ValidatorBloc();

  Provider({Key key, Widget child}): super(key : key, child: child);

  static ValidatorBloc of(BuildContext context) {
    // each widget has seperate context and if we use bloc in some widget it will search up to parent for get specific context if type ()
    return (context.inheritFromWidgetOfExactType(Provider) as Provider).bloc;
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

}