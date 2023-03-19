import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp/utils/constants.dart';
import 'package:get/get.dart';

import '../controller/adventure_tickets_controller.dart';
import '../model/adventure_tickets_model.dart';
import 'at_post_screen.dart';

class AdventureTickets extends StatefulWidget {
  const AdventureTickets({Key? key}) : super(key: key);

  @override
  State<AdventureTickets> createState() => _AdventureTicketsState();
}

class _AdventureTicketsState extends State<AdventureTickets> {
  final List<String> _listItem = [
    'assets/images/background.png',
    'assets/images/bag.png',
    'assets/images/hike.png',
    'assets/images/mountain.png',
    'assets/images/background.png',
    'assets/images/bag.png',
    'assets/images/hike.png',
    'assets/images/mountain.png',
    'assets/images/bag.png',
  ];

  List<AdTicket> tickets = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    AdTicketController.get().then((value) {
      tickets = value;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Text(""),
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage('assets/images/mountain.png'),
                        fit: BoxFit.cover)),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient:
                          LinearGradient(begin: Alignment.bottomRight, colors: [
                        Colors.black.withOpacity(.4),
                        Colors.black.withOpacity(.2),
                      ])),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "Explore Adventure",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 50,
                        margin: EdgeInsets.symmetric(horizontal: 40),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Center(
                            child: Text(
                          "Buy Now",
                          style: TextStyle(
                              color: Colors.grey[900],
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Wrap(
                  runSpacing: 10,
                  spacing: 10,
                  children: tickets.map((ticket) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(AtPostScreen(
                          adTicket: ticket,
                        ));
                      },
                      child: Column(
                        children: [
                          Card(
                            color: Colors.transparent,
                            elevation: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        "$baseUrl/public/${ticket.image}",
                                      ),
                                      fit: BoxFit.cover)),
                              child: Transform.translate(
                                offset: Offset(50, -50),
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 65, vertical: 63),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white),
                                  child: Icon(
                                    Icons.bookmark_border,
                                    size: 15,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "${ticket.name}",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Colors.black),
                          ),
                          Text(
                            "Rs.${ticket.price}",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
