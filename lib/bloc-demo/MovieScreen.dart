import 'package:flutter/material.dart';
import 'package:flutter_app/bloc-demo/MoviesBloc.dart';
import 'package:flutter_app/bloc-demo/model/ItemModel.dart';
import 'package:flutter_app/bloc-demo/network/Repository.dart';

class MovieScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MovieListState();
  }
}

class MovieListState extends State<MovieScreen> {

  MovieBloc bloc = MovieBloc();

  @override
  void initState() {
    super.initState();
    bloc.fetchAllMovies();
  }


  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  new MaterialApp(
        home: new Scaffold (
          resizeToAvoidBottomPadding: false,
          appBar: AppBar(
            title: Text("My Movies"),
          ),
          // StreamBuilder will do the same job what StatefulWidget does i.e updating the UI.
          body: StreamBuilder(
              stream: bloc.allMovies,
              builder: (context, AsyncSnapshot<ItemModel> snapshot){
                if(snapshot.hasData) {
                  return buildList(snapshot);
                } else if(snapshot.hasError){
                  return Text(snapshot.error.toString());
                }
                return Center(child: CircularProgressIndicator(),);
              }
          ),
        ));
  }

  Widget buildList(AsyncSnapshot<ItemModel> snapshot) {
    return GridView.builder(
        itemCount: snapshot.data.results.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return GridTile(
              child: Column(
                children: <Widget> [
                  Expanded(
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w185${snapshot.data
                          .results[index].poster_path}', fit: BoxFit.cover,
                          width: 180,
                    ),
                  ),
                  Center(child: Text(snapshot.data.results[index].title, style: TextStyle(color: Colors.black87),),)
                ],
            ),
          );
        });
  }


}