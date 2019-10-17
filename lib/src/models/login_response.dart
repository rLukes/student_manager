class LoginResponse{
 // String tokenType;
  String accessToken;

  LoginResponse();

  LoginResponse.fromJson(Map<String, dynamic>parseJson){
    //tokenType = parseJson['token_type'];
    accessToken = parseJson['access_token'];
    // print("token: "+access_token);
  }
}