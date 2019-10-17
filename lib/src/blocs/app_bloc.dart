import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'package:student_manager/src/blocs/validators.dart';
import 'package:student_manager/src/resources/repository.dart';

class AppBloc with Validators {
  final repository = new Repository();
  final _username = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  Stream<String> get username => _username.stream.transform(validateUsername);

  Stream<String> get password => _password.stream.transform(validatePassword);

  Function(String) get changeUsername => _username.sink.add;

  Function(String) get changePassword => _password.sink.add;

  Stream<bool> get submitValid =>
      Observable.combineLatest2(username, password, (e, p) => true);



  Future<Map<String, dynamic>> authenticate() async {
    print(_username.value +" : "+_password.value);
    return repository.authenticate(_username.value, _password.value);
  }

  dispose(){
    _username.close();
    _password.close();
  }
}

