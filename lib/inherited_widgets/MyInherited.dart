
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/inherited_widgets/MyInheritedWidgetState.dart';

class MyInherited extends InheritedWidget {

  MyInheritedWidgetState data;

  MyInherited({Key key, @required Widget myChild, @required this.data}) : super(key: key, child: myChild);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }


}