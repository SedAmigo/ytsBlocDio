import 'dart:math';

import 'package:dio/dio.dart';
import 'package:ytsbloc/model/movieresponse.dart';
import 'package:ytsbloc/newmodel/userresponse.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _userEndPoint = "https://randomuser.me/api/";
  final String _moviesEndPoint = "https://yts.mx/api/v2/list_movies.json";
  final String _movieSuggestionEndPoint =
      "https://yts.mx/api/v2/movie_suggestions.json";

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
    var param = {
      "limit": 50,
    };
    try {
      Response response =
          await _dio.get(_moviesEndPoint, queryParameters: param);
      print(response);
      return MovieResponce.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return MovieResponce.withError("$error");
    }
  }

  Future<MovieResponce> getMovieSuggestion() async {
    var random = new Random();
    var ranId = random.nextInt(1000);
    var param ={
      "movie_id":ranId,
    };
    try {
      Response response = await _dio.get(_movieSuggestionEndPoint , queryParameters: param);
      print(response);
      return MovieResponce.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return MovieResponce.withError("$error");
    }
  }

  // Future<MovieResponce> search(String searchValue) async{
  //   try{
  //     Response response = await _dio.get(path)
  //   }catch
  // }
}
