import 'dart:async';

import 'package:student_manager/src/blocs/validators.dart';

class AppBloc with Validators {
  final _username = StreamController<String>();
  final _password = StreamController<String>();

  Stream<String> get username => _username.stream.transform(validateUsername);

  Stream<String> get password => _password.stream.transform(validatePassword);

  Function(String) get changeUsername => _username.sink.add;

  Function(String) get changePassword => _password.sink.add;


  dispose(){
    _username.close();
    _password.close();
  }
}

final appBloc = AppBloc();