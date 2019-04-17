
class Result{

  int _vote_count;
  int _id;
  bool _video;
  var _vote_average;
  String _title;
  double _popularity;
  String _poster_path;
  String _original_language;
  String _original_title;
  List<int> _genre_ids = [];
  String _backdrop_path;
  bool _adult;
  String _overview;
  String _release_date;




  int get vote_count => _vote_count;

  Result(result) {
    _vote_count = result['vote_count'];
    _id = result['id'];
    _video = result['video'];
    _vote_average = result['vote_average'];
    _title = result['title'];
    _popularity = result['popularity'];
    _poster_path = result['poster_path'];
    _original_language = result['original_language'];
    _original_title = result['original_title'];
    for (int i = 0; i < result['genre_ids'].length; i++) {
      _genre_ids.add(result['genre_ids'][i]);
    }
    _backdrop_path = result['backdrop_path'];
    _adult = result['adult'];
    _overview = result['overview'];
    _release_date = result['release_date'];
  }

  int get id => _id;

  bool get video => _video;

  get vote_average => _vote_average;

  String get title => _title;

  double get popularity => _popularity;

  String get poster_path => _poster_path;

  String get original_language => _original_language;

  String get original_title => _original_title;

  List<int> get genre_ids => _genre_ids;

  String get backdrop_path => _backdrop_path;

  bool get adult => _adult;

  String get overview => _overview;

  String get release_date => _release_date;
}