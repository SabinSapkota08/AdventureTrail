import 'dart:convert';

import 'package:fyp/model/product_model.dart';
import 'package:fyp/utils/constants.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProductController extends GetxController {
  Future<Products?> get({String name = ""}) async {
    var url = Uri.parse('$baseUrl/public/api/products?name=$name');
    var response = await http.get(
      url,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
    );
    print(response.body);

    if (response.statusCode == 200) {
      Products products =
          Products.fromJson(jsonDecode(response.body.toString()));

      return products;
    } else {
      print(response.body);
    }
  }
}
