import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp/state/order_controller.dart';
import 'package:fyp/view/checkout_page.dart';
import 'package:get/get.dart';

class CartPage extends StatefulWidget {
  CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final controller = Get.find<ProductStateController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CheckoutPage()),
            );
          },
          child: Text("Check out")),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Cart",
          style: TextStyle(
            fontSize: 20,
            color: Colors.red,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.more_vert,
              size: 30,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(top: 25),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(35),
            topLeft: Radius.circular(35),
          ),
        ),
        child: ListView(
          children: controller.cart.value.map((product) {
            return Container(
              height: 120,
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Radio(
                      value: "",
                      groupValue: "",
                      activeColor: Colors.blue,
                      onChanged: (index) {}),
                  Container(
                    height: 70,
                    width: 70,
                    margin: EdgeInsets.only(right: 15),
                    child: Image.network("${product.image}"),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${product.name}",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        Text(
                          "Npr.50",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            controller.cart.value.remove(product);
                            setState(() {});
                          },
                          icon: Icon(Icons.delete),
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white,
                                    spreadRadius: 1,
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                              child: IconButton(
                                onPressed: () {
                                  controller.cart.value
                                      .where((element) => element == product)
                                      .first
                                      .selectedQuantity = (controller.cart.value
                                              .where((element) =>
                                                  element == product)
                                              .first
                                              .selectedQuantity ??
                                          0) +
                                      1;
                                  setState(() {});
                                },
                                icon: Icon(
                                  CupertinoIcons.plus,
                                  size: 18,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                "${product.selectedQuantity}",
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white,
                                    spreadRadius: 1,
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                              child: IconButton(
                                onPressed: () {
                                  bool isMinus = (controller.cart.value
                                              .where((element) =>
                                                  element == product)
                                              .first
                                              .selectedQuantity ??
                                          0) >
                                      0;
                                  if (isMinus) {
                                    controller.cart.value
                                        .where((element) => element == product)
                                        .first
                                        .selectedQuantity = (controller
                                                .cart.value
                                                .where((element) =>
                                                    element == product)
                                                .first
                                                .selectedQuantity ??
                                            0) -
                                        1;
                                  }

                                  setState(() {});
                                },
                                icon: Icon(
                                  CupertinoIcons.minus,
                                  size: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
