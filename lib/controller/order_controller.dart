import 'dart:convert';

import 'package:fyp/model/order_model.dart';
import 'package:fyp/model/product_model.dart';
import 'package:fyp/utils/constants.dart';
import 'package:http/http.dart' as http;

class OrderController {
  Future<Orders?> create({
    required String order_date,
    required int total_price,
    required bool is_paid,
    required String paid_by,
    required bool is_cancelled,
    required List<Product> product,
  }) async {
    var url = Uri.parse('$baseUrl/public/api/order/create');
    var response = await http.post(url,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        body: jsonEncode({
          "order_date": order_date,
          "total_price": total_price,
          "is_paid": is_paid,
          "paid_by": paid_by,
          "is_cancelled": 0,
          "products": product.map((e) => e.toJson()).toList(),
        }));

    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print(response.body);
    }
  }
}
