import 'dart:async';
import 'package:flutter_app/bloc-demo/model/ItemModel.dart';
import 'package:http/http.dart' show Client;
import 'dart:convert';

class MovieApiProvider{
    Client client = Client();
    final _apiKey = "https://api.themoviedb.org/3/movie/popular?api_key=eda3b76ae69f864057c14a1225174796";

    Future<ItemModel> fetchMovieList() async{
    final response = await client.get(_apiKey);
    if(response.statusCode == 200){
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load movies");
    }
  }

}