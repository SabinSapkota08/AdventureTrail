import 'package:flutter/material.dart';
import 'package:fyp/model/product_model.dart';
import 'package:fyp/state/order_controller.dart';
import 'package:get/get.dart';

class AdPostAppBar extends StatefulWidget {
  AdPostAppBar({Key? key, required this.adPackage}) : super(key: key);
  Product adPackage;

  @override
  State<AdPostAppBar> createState() => _AdPostAppBarState();
}

class _AdPostAppBarState extends State<AdPostAppBar> {
  final orderController = Get.find<ProductStateController>();

  void initState() {
    // darkMode = true;
    super.initState();
  }

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
                  .where((element) => element.id == widget.adPackage.id)
                  .isEmpty) {
                orderController.favourite.value.add(widget.adPackage);
              } else {
                orderController.favourite.value.remove(widget.adPackage);
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
                                (element) => element.id == widget.adPackage.id)
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
