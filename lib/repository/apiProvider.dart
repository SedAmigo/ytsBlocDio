import 'package:dio/dio.dart';
import 'package:ytsbloc/model/movieresponse.dart';
import 'package:ytsbloc/newmodel/userresponse.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _userEndPoint = "https://randomuser.me/api/";
  final String _moviesEndPoint =
      "https://yts.mx/api/v2/list_movies.json?limit=50";
  final String _movieSuggestionEndPoint =
      "https://yts.mx/api/v2/movie_suggestions.json?movie_id=10";

  Future<UserResponse> getUser() async {
    try {
      Response response = await _dio.get(_userEndPoint);
      print(response);
      return UserResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return UserResponse.withError("$error");
    }
  }

  Future<MovieResponce> getMovies() async {
    try {
      Response response = await _dio.get(_moviesEndPoint);
      print(response);
      return MovieResponce.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return MovieResponce.withError("$error");
    }
  }

  Future<MovieResponce> getMovieSuggestion() async {
    try {
      Response response = await _dio.get(_movieSuggestionEndPoint);
      print(response);
      return MovieResponce.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return MovieResponce.withError("$error");
    }
  }
}
