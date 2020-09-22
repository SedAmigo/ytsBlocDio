import 'movie1.dart';

class MovieResponce {
  List<Movie> movies;
  final String error;

  MovieResponce({this.movies, this.error});

  MovieResponce.fromJson(Map<String, dynamic> json)
      : movies =
            (json["movies"] as List).map((i) => new Movie.fromJson(i)).toList(),
        error = "";

  MovieResponce.withError(String errorValue)
      : movies = List(),
        error = errorValue;
}
