
import 'package:flutter_app/bloc-demo/model/ItemModel.dart';
import 'package:flutter_app/bloc-demo/network/Repository.dart';
import 'package:rxdart/rxdart.dart';


class MovieBloc {

  final repository = Repository();
  final movieFetcher = PublishSubject<ItemModel>();
  //final bloc = MovieBloc();

  Observable<ItemModel> get allMovies => movieFetcher.stream;

  fetchAllMovies() async{
    ItemModel itemModel = await repository.fetchAllMovies();
    movieFetcher.sink.add(itemModel);
  }

  dispose(){
    movieFetcher.close();
  }
}
