
import 'package:flutter_app/bloc-demo/model/Result.dart';

class ItemModel{
  int _page;
  int _total_results;
  int _total_pages;
  List<Result> _results = [];

  ItemModel.fromJson(Map<String, dynamic> parsedJson) {
    print(parsedJson['results'].length);
    _page = parsedJson['page'];
    _total_results = parsedJson['total_results'];
    _total_pages = parsedJson['total_pages'];
    List<Result> tmp = [];
    for(int i=0 ; i<parsedJson['results'].length ; i++){
      Result result = Result(parsedJson['results'][i]);
      tmp.add(result);
    }
    _results = tmp;
  }

  List<Result> get results => _results;

  int get total_pages => _total_pages;

  int get total_results => _total_results;

  int get page => _page;
}