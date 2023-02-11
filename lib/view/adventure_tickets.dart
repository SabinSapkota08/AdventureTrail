import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class AdventureTickets extends StatelessWidget {
  const AdventureTickets({super.key});

  @override
  Widget build(BuildContext context) {
    int currentSelect = 0;
    var category = [
      'Best Places',
      'Most Visited',
      'Favourites',
      'New Added',
      'Company',
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(""),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      "Explore the adventure with us!",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  children: [
                    for (int i = 0; i < 5; i++)
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        child: Text(
                          category[i],
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            //fontWeight: currentSelect== i ? FontWeight.w600,
                            //color: currentSelect == i ? mPrimaryColor: Colors.black26,
                          ),
                        ),
                      )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
