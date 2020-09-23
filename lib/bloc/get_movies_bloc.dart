import 'package:rxdart/rxdart.dart';
import 'package:ytsbloc/model/movieresponse.dart';
import 'package:ytsbloc/repository/repository.dart';

class GetMoviesBloc {
  Repository _repository = Repository();

  final BehaviorSubject<MovieResponce> _subject =
      BehaviorSubject<MovieResponce>();

  getMov() async {
    MovieResponce responce = await _repository.getMovie();
    _subject.sink.add(responce);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<MovieResponce> get subject => _subject;
}

final getMovieBoc = GetMoviesBloc();
