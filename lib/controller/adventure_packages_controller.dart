import 'dart:convert';

import 'package:fyp/model/adventure_packages_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AdventurePackageController extends GetxController {
  Future<AdventurePackage?> get() async {
    var url = Uri.parse(
        'http://localhost/adventureTrail/public/api/adventure_packages');
    var response = await http.get(
      url,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
    );

    if (response.statusCode == 200) {
      AdventurePackage packages =
          AdventurePackage.fromJson(jsonDecode(response.body.toString()));

      return packages;
    } else {
      print(response.body);
    }
  }
}
