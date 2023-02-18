import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fyp/model/auth_model.dart';
import 'package:fyp/utils/constants.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;

// Create storage

class LoginController extends GetxController {
  bool loading = false;

  Future<User?> login(
      String username, String password, BuildContext context) async {
    var url = Uri.parse('$baseUrl/public/api/login');
    
    var response = await http.post(url,
   
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        body: jsonEncode({"email": username, "password": password}));

    if (response.statusCode == 200) {
      AuthModel auth = AuthModel.fromJson(jsonDecode(response.body.toString()));
      print("${auth.token}=======");
      final storage = new FlutterSecureStorage();
      await storage.write(key: "token", value: auth.token);

      return auth.user;
    } else {
      print(response.body);
    }
    // loading = true;
    // update();
    // var navigator = Navigator.of(context);
    // RemoteService service = RemoteService();
    // var response = await service.login(username, password);
    // bool status = response.data['status'];
    // //if (status == false) {
    //   if (!status) {
    //   Fluttertoast.showToast(msg: response.data['profile']['id']);
    //   // FToast.toast(context, msg: response.data['message']);
    // } else {
    //   log(response.data['profile']['id'].toString());
    //  // FToast.toast(context, msg: response.data['message']);
    //   Fluttertoast.showToast(msg: response.data['message']);
    //   UserCredintials userCredintials = UserCredintials();
    //   userCredintials.storeId(int.parse(response.data['profile']['id']));
    //   navigator.pushNamedAndRemoveUntil('/homepage', (a) => false);
    // }
    //  loading = false;
    //  update();
  }

  Future<User?> register(
      {required String email,
      required String password,
      required String name,
      required String confirm_password,
      required String phone_number}) async {
    var url = Uri.parse('http://localhost/adventureTrail/public/api/register');
    var response = await http.post(url,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        body: jsonEncode({
          "email": email,
          "name": name,
          "password": password,
          "confirm_password": confirm_password,
          "phone": phone_number,
        }));

    if (response.statusCode == 200) {
      AuthModel auth = AuthModel.fromJson(jsonDecode(response.body.toString()));
      print("${auth.token}=======");
      final storage = new FlutterSecureStorage();
      await storage.write(key: "token", value: auth.token);

      return auth.user;
    } else {
      print(response.body);
    }
    // loading = true;
    // update();
    // var navigator = Navigator.of(context);
    // RemoteService service = RemoteService();
    // var response = await service.login(username, password);
    // bool status = response.data['status'];
    // //if (status == false) {
    //   if (!status) {
    //   Fluttertoast.showToast(msg: response.data['profile']['id']);
    //   // FToast.toast(context, msg: response.data['message']);
    // } else {
    //   log(response.data['profile']['id'].toString());
    //  // FToast.toast(context, msg: response.data['message']);
    //   Fluttertoast.showToast(msg: response.data['message']);
    //   UserCredintials userCredintials = UserCredintials();
    //   userCredintials.storeId(int.parse(response.data['profile']['id']));
    //   navigator.pushNamedAndRemoveUntil('/homepage', (a) => false);
    // }
    //  loading = false;
    //  update();
  }
}
