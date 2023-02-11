import 'package:flutter/material.dart';
import 'package:fyp/model/adventure_packages_model.dart';
import 'package:fyp/view/ad_post_app_bar.dart';
import 'package:fyp/view/ad_post_bottom_bar.dart';

class AdPostScreen extends StatelessWidget {
  AdPostScreen({Key? key, required this.adPackage}) : super(key: key);
  AdPackage adPackage;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background.png"),
          fit: BoxFit.cover,
          opacity: 0.7,
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
