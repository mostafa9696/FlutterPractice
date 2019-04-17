
import 'package:flutter_app/bloc-demo/model/ItemModel.dart';
import 'package:flutter_app/bloc-demo/network/MovieAPIProvider.dart';

class Repository{
  final MovieApiProvider  movieApiProvider = MovieApiProvider();
  Future<ItemModel> fetchAllMovies() => movieApiProvider.fetchMovieList();
}