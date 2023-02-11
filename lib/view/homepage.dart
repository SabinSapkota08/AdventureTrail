import 'package:flutter/material.dart';
import 'package:fyp/controller/product_controller.dart';
import 'package:fyp/model/product_model.dart';
import 'package:fyp/view/detail_page.dart';
import 'package:fyp/view/search.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'adventure_package.dart';
import 'adventure_tickets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product> products = [];
  void initState() {
    super.initState();

    ProductController().get().then((value) {
      products = value?.data ?? [];
      setState(() {});
    });
  }

  String selectedProduct = "equipment";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 30),
          padding: const EdgeInsets.symmetric(vertical: 27, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: <Widget>[
                  Column(
                    children: const [
                      Text(
                        "Location",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 12.5,
                            color: Colors.grey),
                      ),
                      Text(
                        "Pokhara",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 24,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.notification_add)),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
              Column(
                children: [
                  Container(
                    child: Padding(
                      //padding: EdgeInsets.all(value)
                      padding: EdgeInsets.fromLTRB(10, 15, 20, 5),
                      child: IconButton(
                        onPressed: () {
                          // method to show the search bar
                          showSearch(
                              context: context,
                              // delegate to customize the search bar
                              delegate: CustomSearchDelegate());
                        },
                        icon: const Icon(Icons.search),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width - 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        SizedBox(
                          width: (MediaQuery.of(context).size.width / 3) - 14,
                          child: ChoiceChip(
                            label: Text(
                              "Equipments",
                            ),
                            selected: true,
                            onSelected: (a) {
                              selectedProduct = "equipment";
                              setState(() {});
                            },
                            labelStyle: TextStyle(color: Colors.white),
                            selectedColor: selectedProduct == "equipment"
                                ? Colors.red
                                : Colors.blue,
                          ),
                        ),
                        SizedBox(
                          width: (MediaQuery.of(context).size.width / 3) - 14,
                          child: ChoiceChip(
                            label: Text(
                              "Packages",
                            ),
                            selected: true,
                            onSelected: (a) {
                              selectedProduct = "packages";
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        AdventurePackagePage(),
                                  ));
                              setState(() {});
                            },
                            labelStyle: TextStyle(color: Colors.white),
                            selectedColor: selectedProduct == "packages"
                                ? Colors.red
                                : Colors.blue,
                          ),
                        ),
                        SizedBox(
                          width: (MediaQuery.of(context).size.width / 3) - 14,
                          child: ChoiceChip(
                            label: Text(
                              "Adventure Tickets",
                            ),
                            selected: true,
                            onSelected: (a) {
                              selectedProduct = "tickets";
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AdventureTickets(),
                                  ));
                              setState(() {});
                            },
                            labelStyle: TextStyle(color: Colors.white),
                            selectedColor: selectedProduct == "tickets"
                                ? Colors.red
                                : Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Text(
                "Most Popular",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 250,
                      child: ListView.builder(
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {},
                            child: Container(
                              width: 160,
                              padding: EdgeInsets.all(20),
                              margin: EdgeInsets.only(left: 15),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                    image: AssetImage("assets/images/hike.png"),
                                    fit: BoxFit.cover,
                                    opacity: 0.7),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    alignment: Alignment.topRight,
                                    child: Icon(
                                      Icons.bookmark_add_outlined,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      "Trekking Bag",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Best for you",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "See more",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 12.83,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    child: Column(
                      children: this.products.map((product) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(ProductDetailPage(
                              product: product,
                            ));
                          },
                          child: Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 95,
                                  width: 140,
                                  margin: EdgeInsets.only(top: 10),
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(18),
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(
                                              product.image ?? ""))),
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${product.name}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 17.1,
                                      ),
                                    ),
                                    Text(
                                      "Rs. ${product.mrp}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: Color(0xfff0A8ED9),
                                        fontSize: 12.83,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),

      // appBar: AppBar(
      //   title: const Text(
      //     "Adventure Trail",
      //   ),
      //   actions: [
      //     IconButton(
      //       onPressed: () {
      //         // method to show the search bar
      //         showSearch(
      //             context: context,
      //             // delegate to customize the search bar
      //             delegate: CustomSearchDelegate()
      //         );
      //       },
      //       icon: const Icon(Icons.search),
      //     )
      //   ],
      // ),

      // body: Center(
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       TextButton(onPressed:() {
      //
      //       }, , child: Text("Equipments") ),
      //
      //     ],
      //   ),
      //
      // ),
    );
  }
}
