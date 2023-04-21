import 'package:flutter/material.dart';
import 'package:fyp/model/product_model.dart';
import 'package:fyp/utils/constants.dart';
import 'package:fyp/view/at_post_app_bar.dart';
import 'package:fyp/view/at_post_bottom_bar.dart';

class AtPostScreen extends StatelessWidget {
  AtPostScreen({Key? key, required this.adTicket}) : super(key: key);

  Product adTicket;

  //required this.atTicket

  //AtTicket atTicket;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image:
              NetworkImage("$baseUrl/public/${adTicket.description_img?.last}"),
          fit: BoxFit.cover,
          opacity: 0.7,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: AtPostAppBar(
            adTicket: adTicket,
          ),
        ),
        bottomNavigationBar: AtPostBottomBar(
          adTicket: adTicket,
          //atTicket: atTicket,
        ),
      ),
    );
  }
}
