import 'package:flutter/material.dart';
import 'package:fyp/view/at_post_app_bar.dart';
import 'package:fyp/view/at_post_bottom_bar.dart';

import '../model/adventure_tickets_model.dart';

class AtPostScreen extends StatelessWidget {
  AtPostScreen({Key? key, required this.adTicket}) : super(key: key);

  AdTicket adTicket;

  //required this.atTicket

  //AtTicket atTicket;

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
          child: AtPostAppBar(
              //atTicket: atTicket,
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
