import 'package:flutter/material.dart';
import 'package:fyp/controller/order_controller.dart';
import 'package:fyp/model/order_model.dart';
import 'package:fyp/view/order_detail_page.dart';
import 'package:get/get.dart';

class MyOrdersPage extends StatefulWidget {
  @override
  State<MyOrdersPage> createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage> {
  List<Order> orders = [];
  void initState() {
    super.initState();

    OrderController().get().then((value) {
      orders = value?.data ?? [];
      setState(() {});
    });
  }

  // List<Product> products = [];
  // void initState() {
  //   super.initState();
  //
  //   ProductController().get().then((value) {
  //     products = value?.data ?? [];
  //     setState(() {});
  //   });
  // }
  //
  // String selectedProduct = "equipment";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.white,
        shadowColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: Text('My Orders'),
      ),
      body: ListView.builder(
        itemCount: orders.length, // replace with actual number of orders
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              onTap: () {
                Get.to(OrderDetailPage(
                  order: orders[index],
                ));
              },

              title: Text('Order #${orders[index].id}'),
              subtitle: Text('Order Details'),
              trailing: Text(
                  '\Rs.${orders[index].totalPrice}'), // replace with actual order total
            ),
          );
        },
      ),
    );
  }
}
