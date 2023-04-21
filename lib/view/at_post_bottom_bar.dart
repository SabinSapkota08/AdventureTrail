import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp/model/product_model.dart';
import 'package:fyp/state/order_controller.dart';
import 'package:fyp/utils/constants.dart';
import 'package:get/get.dart';

import 'product_checkout_page.dart';

class AtPostBottomBar extends StatefulWidget {
  AtPostBottomBar({Key? key, required this.adTicket}) : super(key: key);
  Product adTicket;

  @override
  State<AtPostBottomBar> createState() => _AtPostBottomBarState();
}

class _AtPostBottomBarState extends State<AtPostBottomBar> {
  final orderController = Get.find<ProductStateController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
      decoration: BoxDecoration(
        color: Color(0xFFEDF2F6),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40)),
      ),
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${widget.adTicket.name}",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                      ),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (orderController.cart.value
                                .where((element) =>
                                    element.id == widget.adTicket.id)
                                .isEmpty) {
                              orderController.cart.value.add(widget.adTicket);
                            } else {
                              orderController.cart.value
                                  .where((element) =>
                                      element.id == widget.adTicket.id)
                                  .first
                                  .selectedQuantity = (orderController
                                          .cart.value
                                          .where((element) =>
                                              element.id == widget.adTicket.id)
                                          .first
                                          .selectedQuantity ??
                                      0) +
                                  1;
                            }
                          },
                          child: Container(
                            child: Icon(
                              orderController.cart.value
                                      .where((element) =>
                                          element == widget.adTicket)
                                      .isEmpty
                                  ? Icons.add_shopping_cart
                                  : Icons.shopping_cart,
                              size: 25,
                              color: Colors.amber,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 25),
                ListTile(
                  leading: Container(
                    height: 42.76,
                    width: 42.76,
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                "https://images.pexels.com/photos/15286/pexels-photo.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"))),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${widget.adTicket.vendor?.name}",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 17.1,
                            ),
                          ),
                          Text(
                            "Owner",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "${widget.adTicket.desc}",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 20),
                Row(
                  children: (widget.adTicket.description_img ?? []).map((e) {
                    return Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            "${baseUrl}/public/${e}",
                            fit: BoxFit.cover,
                            width: 120,
                            height: 90,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 90,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.black, blurRadius: 4)
                          ],
                        ),
                        child: Icon(
                          Icons.bookmark_add_outlined,
                          size: 30,
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          DateTimeRange? dateTimeRange =
                              await showDateRangePicker(
                                  context: context,
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(2050));
                          widget.adTicket.rentFrom = dateTimeRange?.start;

                          orderController.cart.value.clear();
                          orderController.cart.value.add(widget.adTicket);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductCheckoutPage()));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.redAccent,
                            boxShadow: [
                              BoxShadow(color: Colors.black26, blurRadius: 4)
                            ],
                          ),
                          child: Text(
                            "Buy now",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
