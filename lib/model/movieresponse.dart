import 'package:ytsbloc/model/data_model.dart';

class MovieResponce {
  Data data;
  final String error;

  MovieResponce({this.data, this.error});

  MovieResponce.fromJson(Map<String, dynamic> json)
      : data = Data.fromJson(json["data"]),
        error = "";

  MovieResponce.withError(String errorValue) : error = errorValue;
}
