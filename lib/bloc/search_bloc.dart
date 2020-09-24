import 'package:rxdart/rxdart.dart';
import 'package:ytsbloc/model/movieresponse.dart';
import 'package:ytsbloc/repository/apiProvider.dart';

class SearchBloc{
  ApiProvider _repository = ApiProvider();

  BehaviorSubject<MovieResponce> _subject = BehaviorSubject<MovieResponce>();

  search(String value) async{
    MovieResponce responce = await _repository.search(value);
    _subject.sink.add(responce);
  }

  dispose(){
    _subject.close();
  }

  BehaviorSubject<MovieResponce> get subject => _subject;
}

final searchBloc = SearchBloc();