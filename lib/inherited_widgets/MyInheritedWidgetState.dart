
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/inherited_widgets/Item.dart';
import 'package:flutter_app/inherited_widgets/MyInherited.dart';

class MyInheritedWidget extends StatefulWidget{

  MyInheritedWidget({
    Key key,
    this.myChild,
  }): super(key: key);

  final Widget myChild;

  @override
  State<StatefulWidget> createState() => new MyInheritedWidgetState();

  static MyInheritedWidgetState of (BuildContext context){
    return (context.inheritFromWidgetOfExactType(MyInherited) as MyInherited).data;
  }
}

class MyInheritedWidgetState extends State<MyInheritedWidget>{

  List<Item> _items = <Item>[];
  int itemNum = 0;

  int get itemsCount => _items.length;

  void addItem(String cart){
    setState(() {
      _items.add(Item('$cart $itemNum'));
    });
  }

  void increseNum() => itemNum+=1;


  List<Item> get items => _items;

  @override
  Widget build(BuildContext context) {
    return new MyInherited(
        myChild: widget.myChild,
        data: this
    );
  }

}