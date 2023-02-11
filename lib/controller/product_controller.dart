import 'dart:convert';

import 'package:fyp/model/product_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProductController extends GetxController {
  Future<Products?> get() async {
    var url = Uri.parse('http://localhost/adventureTrail/public/api/products');
    var response = await http.get(
      url,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
    );

    if (response.statusCode == 200) {
      Products products =
          Products.fromJson(jsonDecode(response.body.toString()));

      return products;
    } else {
      print(response.body);
    }
  }
}
