import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:student_manager/src/models/login_response.dart';
import 'dart:io';
import '../blocs/app_bloc.dart';

import 'package:student_manager/src/resources/api_url.dart';

class ApiProvider{
  final String tokenType = "Bearer";
  String _username;
  String _password;
  String _token;

  Future<Map<String, dynamic>> authenticate(String username, String password) async{
    bool hasError = true;
    String message = '';
    String title = "Log in error";

    var response =  await _authenticate(username, password);
    if(response.statusCode == HttpStatus.ok) {
      final responseJson = json.decode(response.body);
      var loginResult = LoginResponse.fromJson(responseJson);
      _token = loginResult.accessToken;
      print("taoken "+ _token);
      _username = username;
      _password = password;
     /* await appBloc.persistSecureValues(_username, _password, _token);
      appBloc.loggedInSink.add(true);*/
      hasError = false;
    }
    else if(response.statusCode == 401) {
      hasError = true;
      message = "Wrong username or password";
      title = "Not authorized";
      //appBloc.loggedInSink.add(false);
    } else {
      hasError = true;
      message = response.body;
      //appBloc.loggedInSink.add(false);
    }
    return {'success': !hasError, 'title' : title, 'message': message};
  }

  Future<http.Response> _authenticate(String userName, String password) async{


    final url = ApiUrls.urlApiServer + "" + ApiUrls.urlApiEndpointAuth;
    //return await http.get(url, headers: {HttpHeaders.authorizationHeader: headersInfo});
    return await http.post(url,body: {'username':userName, 'password':password});
  }
}