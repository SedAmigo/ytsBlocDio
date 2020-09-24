import 'package:ytsbloc/model/movieresponse.dart';
import 'package:ytsbloc/newmodel/userresponse.dart';
import 'package:ytsbloc/repository/apiProvider.dart';

class Repository{
  ApiProvider _apiProvider = ApiProvider();
  
  Future<UserResponse> getUser(){
    return _apiProvider.getUser();
  }

  Future<MovieResponce> getMovie(){
    return _apiProvider.getMovies();
  }

  Future<MovieResponce> getSuggestions(){
    return _apiProvider.getMovieSuggestion();
  }

  // Future<MovieResponce> movieSearch(String value){
  //   return _apiProvider.search(value);
  // }
}