import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp/model/product_model.dart';
import 'package:fyp/state/order_controller.dart';
import 'package:get/get.dart';

class AtPostAppBar extends StatefulWidget {
  AtPostAppBar({Key? key, required this.adTicket}) : super(key: key);
  Product adTicket;

  @override
  State<AtPostAppBar> createState() => _AtPostAppBarState();
}

class _AtPostAppBarState extends State<AtPostAppBar> {
  final orderController = Get.find<ProductStateController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 6,
                  ),
                ],
              ),
              child: Icon(
                Icons.arrow_back_ios,
                size: 28,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              if (orderController.favourite.value
                  .where((element) => element.id == widget.adTicket.id)
                  .isEmpty) {
                orderController.favourite.value.add(widget.adTicket);
              } else {
                orderController.favourite.value.remove(widget.adTicket);
              }
              orderController.favourite.refresh();
              setState(() {});
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 6,
                  ),
                ],
              ),
              child: Container(
                height: 29.93,
                width: 29.93,
                child: Center(
                  child: Icon(
                    Icons.favorite,
                    //  size: 12.83,
                    color: orderController.favourite.value
                            .where(
                                (element) => element.id == widget.adTicket.id)
                            .isEmpty
                        ? Colors.black
                        : Colors.red,
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.34),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool isFavourite = false;

  changeFavourite() {
    isFavourite = !isFavourite;
    setState(() {});
  }
}
