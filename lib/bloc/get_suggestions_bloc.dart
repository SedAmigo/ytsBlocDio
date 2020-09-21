import 'package:rxdart/rxdart.dart';
import 'package:ytsbloc/model/movieresponse.dart';
import 'package:ytsbloc/repository/apiProvider.dart';
import 'package:ytsbloc/repository/repository.dart';

class GetSuggestionBloc {
  Repository _repository = Repository();

  final BehaviorSubject<MovieResponce> _subject =
      BehaviorSubject<MovieResponce>();

  getSug() async {
    MovieResponce responce = await _repository.getSuggestions();
    _subject.sink.add(responce);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<MovieResponce> get subject => _subject;
}

final suggetionBloc = GetSuggestionBloc();
