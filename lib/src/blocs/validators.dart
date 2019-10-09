import 'dart:async';

class Validators {
  final validateUsername = StreamTransformer<String, String>.fromHandlers(
    handleData: (username, sink) {
      if (username.length > 3) {
        sink.add(username);
      } else {
        sink.addError('Invalid username');
      }
    },
  );


  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
        if (password.isNotEmpty) {
          sink.add(password);
        } else {
          sink.addError("password can not be empty");
        }
      }
  );
}