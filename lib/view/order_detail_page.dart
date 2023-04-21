import 'package:flutter/material.dart';
import 'package:fyp/model/order_model.dart';
import 'package:fyp/utils/constants.dart';
import 'package:get/get.dart';

class OrderDetailPage extends StatelessWidget {
  OrderDetailPage({Key? key, required this.order}) : super(key: key);
  Order order;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        // backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    "Order date",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.blue,
                      wordSpacing: 2,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "${order.createdAt}",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      wordSpacing: 2),
                ),
                Positioned(
                  left: 40,
                  top: 2,
                  child: Container(
                    width: Get.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 20,
                          child: Divider(
                            thickness: 3,
                            height: 3,
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          width: Get.width - 100,
                          child: Text(
                            // "Npr.${product.mrp}",
                            "Your order details",
                            style: TextStyle(
                                height: 3,
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          width: Get.width - 100,
                          child: Text(
                            "Your product details { order 73-0-00}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                height: 3,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          children:
                              (order.orderDetails ?? []).map((orderDetail) {
                            return Container(
                              height: 120,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    height: 70,
                                    width: 70,
                                    margin: EdgeInsets.only(right: 15),
                                    child: Image.network(
                                        "${baseUrl}/public/${orderDetail.product?.image}"),
                                  ),
                                  Container(
                                    height: 70,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${orderDetail.product?.name}",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue,
                                          ),
                                        ),
                                        Text(
                                          "Quantity: x ${orderDetail.productQuantity}",
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w300,
                                              color: Colors.grey),
                                        ),
                                        Text(
                                          "Rs.${orderDetail.productAmount}",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                    height: Get.height - 200,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(top: 25),
                    decoration: BoxDecoration(
                      color: Color(0xfff0368ee),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
