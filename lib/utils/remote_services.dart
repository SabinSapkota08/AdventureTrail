import 'package:dio/dio.dart';
import 'package:fyp/utils/constants.dart';

class RemoteService{
  Future<Response>login(String username, String password)async{



    
    String url = "$baseUrl/api/login.php";
    var data = FormData.fromMap({
      "username":username,
      "password":password,
    });
    var response = await Dio().post(url, data: data);
    return response;
  }
  
  // Future<Response> fetchInterns() async {
  //   String url = "$baseUrl/api/read_interns.php";
  //   var response = Dio().get(url);
  //   return response;
  // }
}