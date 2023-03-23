import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp/controller/order_controller.dart' as order;
import 'package:fyp/state/order_controller.dart';
import 'package:get/get.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

class ProductCheckoutPage extends StatefulWidget {
  @override
  State<ProductCheckoutPage> createState() => _ProductCheckoutPageState();
}

class _ProductCheckoutPageState extends State<ProductCheckoutPage> {
  final orderController = Get.find<ProductStateController>();
  final config = PaymentConfig(
    amount: 10000, // Amount should be in paisa
    productIdentity: 'dell-g5-g5510-2021',
    productName: 'Dell G5 G5510 2021',
    productUrl: 'https://www.khalti.com/#/bazaar',
    additionalData: {
      // Not mandatory; can be used for reporting purpose
      'vendor': 'Khalti Bazaar',
    },
    mobile:
        '9846045052', // Not mandatory; can be used to fill mobile number field
    mobileReadOnly: false, // Not mandatory; makes the mobile field not editable
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Checkout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Shipping Information',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Full Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Address',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'City',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Postal Code',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 32),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.96,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Summary",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Sub total"),
                            Text(
                                "Rs.${orderController.cart.value.fold(0, (previousValue, element) => (element.mrp ?? 0) + (int.parse(previousValue.toString())))}"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Delivery Charge:"),
                            Text("Rs.${20}")
                          ],
                        ),
                      ],
                    ),
                    Divider(
                      height: 20,
                      thickness: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total"),
                        Text(
                            "Rs.${orderController.cart.value.fold(0, (previousValue, element) => (element.mrp ?? 0) + (int.parse(previousValue.toString()))) + 20}"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Text(
              "Note :All the documents related customers are taken before renting like photo copies of citizen ship certificate.",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (e) {
                      return AlertDialog(
                        title: Text("Select Payment method:"),
                        content: SizedBox(
                          height: 70,
                          child: Column(
                            children: [
                              Wrap(
                                spacing: 10,
                                runSpacing: 10,
                                children: [
                                  KhaltiButton(
                                    label: "Pay with khalti",
                                    config: config,
                                    preferences: [
                                      // Not providing this will enable all the payment methods.
                                      PaymentPreference.khalti,
                                      PaymentPreference.eBanking,
                                    ],
                                    onSuccess: (successModel) {
                                      order.OrderController().create(
                                          order_date:
                                              DateTime.now().toIso8601String(),
                                          total_price:
                                              orderController.cart.value.fold(
                                                  0,
                                                  (previousValue, element) =>
                                                      (element.mrp ?? 0) +
                                                      previousValue),
                                          is_paid: true,
                                          paid_by: "khalti",
                                          is_cancelled: false,
                                          product: orderController.cart.value
                                              .toList());
                                      // Perform Server Verification
                                    },
                                    onFailure: (failureModel) {
                                      // What to do on failure?
                                    },
                                    onCancel: () {
                                      // User manually cancelled the transaction
                                    },
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Text(
                                      "cash on delivery",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              },
              child: Text('Place Order'),
            ),
          ],
        ),
      ),
    );
  }
}
