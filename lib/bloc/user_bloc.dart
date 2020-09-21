import 'package:rxdart/rxdart.dart';
import 'package:ytsbloc/newmodel/userresponse.dart';
import 'package:ytsbloc/repository/repository.dart';

class UserBloc {
  final Repository _repository = Repository();

  final BehaviorSubject<UserResponse> _subject =
      BehaviorSubject<UserResponse>();

  getUser() async{
    UserResponse response  = await _repository.getUser();
    _subject.sink.add(response);

  }

  dispose(){
    _subject.close();
  }
  BehaviorSubject<UserResponse> get subject => _subject;
}

final userBloc = UserBloc();