import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fyp/model/order_model.dart';
import 'package:fyp/model/product_model.dart';
import 'package:fyp/utils/constants.dart';
import 'package:http/http.dart' as http;

class OrderController {
  Future<bool> create({
    required String order_date,
    required int total_price,
    required bool is_paid,
    required String paid_by,
    required bool is_cancelled,
    required List<Product> product,
  }) async {
    var url = Uri.parse('$baseUrl/public/api/order/create');
    final storage = new FlutterSecureStorage();
    var token = await storage.read(key: "token");
    print(token);
    var response = await http.post(url,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode({
          "order_date": DateTime.now().toIso8601String(),
          "total_price": total_price,
          "is_paid": is_paid,
          "paid_by": paid_by,
          "is_cancelled": 0,
          "products": product.map((e) => e.toJson()).toList(),
        }));
    print(response.body);
    if (response.statusCode == 200) {
      return true;
    } else {
      print(response.body);
    }
    return false;
  }

  Future<Orders?> get() async {
    final storage = new FlutterSecureStorage();
    var token = await storage.read(key: "token");
    var url = Uri.parse('$baseUrl/public/api/orders');
    var response = await http.get(
      url,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      print(response.body);
      Orders orders = Orders.fromJson(jsonDecode(response.body.toString()));

      return orders;
    } else {
      print(response.body);
    }
  }
}
