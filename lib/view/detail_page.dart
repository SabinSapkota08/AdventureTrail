import 'package:flutter/material.dart';
import 'package:fyp/model/product_model.dart';
import 'package:fyp/state/order_controller.dart';
import 'package:fyp/utils/constants.dart';
import 'package:fyp/view/product_checkout_page.dart';
import 'package:get/get.dart';

class ProductDetailPage extends StatefulWidget {
  ProductDetailPage({super.key, required this.product});
  Product product;

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final orderController = Get.find<ProductStateController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: GetBuilder<ProductStateController>(builder: (orderController) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 290,
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(18),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              "$baseUrl/public/${widget.product.image}"))),
                ),
                SizedBox(
                  height: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Description",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 17.1,
                      ),
                    ),
                    Text(
                      "${widget.product.desc}",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 12.83,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
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
                                "Sabin Sapkota",
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
                          GestureDetector(
                            onTap: () {
                              if (orderController.favourite.value
                                  .where((element) =>
                                      element.id == widget.product.id)
                                  .isEmpty) {
                                orderController.favourite.value
                                    .add(widget.product);
                              } else {
                                orderController.favourite.value
                                    .remove(widget.product);
                              }
                              setState(() {});
                            },
                            child: Container(
                              height: 29.93,
                              width: 29.93,
                              child: Center(
                                  child: Icon(
                                Icons.favorite,
                                size: 12.83,
                                color: orderController.favourite.value
                                        .where((element) =>
                                            element.id == widget.product.id)
                                        .isEmpty
                                    ? Colors.white
                                    : Colors.red,
                              )),
                              decoration: BoxDecoration(
                                color: Color(0xfff0A8ED9).withOpacity(0.5),
                                borderRadius: BorderRadius.circular(5.34),
                              ),
                            ),
                          )
                        ],
                      ),
                      trailing: GestureDetector(
                        onTap: () {
                          if (orderController.cart.value
                              .where(
                                  (element) => element.id == widget.product.id)
                              .isEmpty) {
                            orderController.cart.value.add(widget.product);
                          } else {
                            orderController.cart.value
                                .where((element) =>
                                    element.id == widget.product.id)
                                .first
                                .selectedQuantity = (orderController.cart.value
                                        .where((element) =>
                                            element.id == widget.product.id)
                                        .first
                                        .selectedQuantity ??
                                    0) +
                                1;
                          }
                        },
                        child: Container(
                          height: 29.93,
                          width: 29.93,
                          child: Center(
                            child: Icon(
                              orderController.cart.value
                                      .where((element) =>
                                          element == widget.product)
                                      .isEmpty
                                  ? Icons.add_shopping_cart
                                  : Icons.shopping_cart,
                              size: 12.83,
                              color: Colors.white,
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xfff0A8ED9).withOpacity(0.5),
                            borderRadius: BorderRadius.circular(5.34),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            );
          }),
        ),
        bottomNavigationBar: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Price",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    "Rs.${widget.product.mrp}",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 17.1,
                    ),
                  )
                ],
              ),
              Container(
                // decoration: BoxDecoration(
                //     color: Color(0xfff0A8ED9),
                //     borderRadius: BorderRadius.circular(10.69)),
                // padding:
                //     EdgeInsets.symmetric(horizontal: 25.66, vertical: 12.83),
                // // child: TextButton(
                // //   "Order Now",
                // //   style: TextStyle(
                // //       fontWeight: FontWeight.w600,
                // //       fontSize: 17.1,
                // //       color: Colors.white),
                // // ),
                child: ElevatedButton(
                  onPressed: () {
                    orderController.cart.value.clear();
                    orderController.cart.value.add(widget.product);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductCheckoutPage()));
                  },
                  child: Text("Order now"),
                ),
              ),
            ],
          ),
        ));
  }
}
