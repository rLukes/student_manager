
import 'package:student_manager/src/resources/api_provider.dart';

class Repository{
  ApiProvider apiProvider = ApiProvider();


  Future<Map<String, dynamic>> authenticate(String username, String password) async{
    return await apiProvider.authenticate(username, password);
  }

}