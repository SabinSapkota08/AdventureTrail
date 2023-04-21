import 'package:flutter/material.dart';
import 'package:fyp/model/product_model.dart';
import 'package:fyp/utils/constants.dart';
import 'package:fyp/view/ad_post_app_bar.dart';
import 'package:fyp/view/ad_post_bottom_bar.dart';

class AdPostScreen extends StatelessWidget {
  AdPostScreen({
    Key? key,
    required this.adPackage,
  }) : super(key: key);
  Product adPackage;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              "$baseUrl/public/${adPackage.description_img?.last}"),
          fit: BoxFit.cover,
          opacity: 1,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: AdPostAppBar(
            adPackage: adPackage,
          ),
        ),
        bottomNavigationBar: AdPostBottomBar(
          adPackage: adPackage,
        ),
      ),
    );
  }
}
