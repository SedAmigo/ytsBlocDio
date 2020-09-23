import 'package:ytsbloc/model/movies.dart';

class Data {
    Data({
        this.movieCount,
        this.limit,
        this.pageNumber,
        this.movies,
    });

    int movieCount;
    int limit;
    int pageNumber;
    List<Movies> movies;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        movieCount: json["movie_count"],
        limit: json["limit"],
        pageNumber: json["page_number"],
        movies: List<Movies>.from(json["movies"].map((x) => Movies.fromJson(x))),
    );

   
}



