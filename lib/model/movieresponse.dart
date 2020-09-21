import 'package:ytsbloc/model/movies.dart';

class MovieResponce {
  List<Movies> movies;
  final String error;

  MovieResponce({this.movies, this.error});

  MovieResponce.fromJson(Map<String, dynamic> json)
      : movies = (json["movies"] as List)
            .map((i) => new Movies.fromJson(i))
            .toList(),
        error = "";

  MovieResponce.withError(String errorValue)
      : movies = List(),
        error = errorValue;
}
