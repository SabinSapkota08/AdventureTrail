import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fyp/controller/product_controller.dart';
import 'package:fyp/model/product_model.dart';
import 'package:fyp/utils/constants.dart';
import 'package:fyp/view/equipmentDetail_page.dart';
import 'package:fyp/view/equipment_page.dart';
import 'package:fyp/view/notification_page.dart';
//import 'package:get/get_core/src/get_main.dart';
import 'package:fyp/view/product_category_model.dart';
import 'package:get/get.dart';

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
    search();
  }

  void search({String name = ""}) {
    ProductController().get(name: name).then((value) {
      products = value?.data ?? [];
      setState(() {});
    });
  }

  final TextEditingController _searchEditingController =
      new TextEditingController();

  String selectedProduct = "";

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
                            fontSize: 10.5,
                            color: Colors.grey),
                      ),
                      Text(
                        "Pokhara",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NotificationPage(),
                            ));
                      },
                      icon: Icon(Icons.notification_add)),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  TextField(
                    controller: _searchEditingController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 15),
                      hintText: "Search",
                      suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          search(name: _searchEditingController.text);
                        },
                      ),
                      // prefix: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: const BorderSide(),
                      ),
                    ),
                  ),
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
                              Get.to(EquipmentPage(
                                  products: products
                                      .where((element) =>
                                          element.type == "product")
                                      .toList()));
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
                                    builder: (context) => AdventurePackagePage(
                                      packages: products
                                          .where((element) =>
                                              element.type == "package")
                                          .toList(),
                                    ),
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
                              "Tickets",
                            ),
                            selected: true,
                            onSelected: (a) {
                              selectedProduct = "tickets";
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AdventureTickets(
                                      tickets: products
                                          .where((element) =>
                                              element.type == "ticket")
                                          .toList(),
                                    ),
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
                        itemCount: 1,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {},
                            child: Container(
                              child: CarouselSlider(
                                options: CarouselOptions(
                                  aspectRatio: 16 / 9,
                                  viewportFraction: 0.8,
                                  enlargeStrategy:
                                      CenterPageEnlargeStrategy.zoom,
                                  // scrollDirection: Axis.vertical,
                                  autoPlay: true,
                                ),
                                items: Category.categories
                                    .map((category) =>
                                        ProductCarasoul(category: category))
                                    .toList(),
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
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    child: this
                            .products
                            .where((element) => element.type == "product")
                            .isNotEmpty
                        ? Column(
                            children: this
                                .products
                                .where((element) => element.type == "product")
                                .toList()
                                .map((product) {
                              return GestureDetector(
                                onTap: () {
                                  Get.to(EquipmentPostScreen(
                                    product: product,
                                  ));
                                },
                                child: Container(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 95,
                                        width: 140,
                                        margin: EdgeInsets.only(top: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(18),
                                            image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: NetworkImage(
                                                    "$baseUrl/public/${product.image}"))),
                                      ),
                                      SizedBox(
                                        width: 50,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${product.name} ",
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
                          )
                        : Text(
                            "Not found",
                            style: TextStyle(
                                fontWeight: FontWeight.w300, fontSize: 18),
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
    );
  }
}

class ProductCarasoul extends StatelessWidget {
  final Category category;
  const ProductCarasoul({
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: <Widget>[
              Image.network(category.imageUrl,
                  fit: BoxFit.cover, width: 1000.0),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  child: Text(
                    category.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  final products = ["Tent", "Sleeping_Bag", "Bag", "Trekking-poles"];
  final recentProducts = ["Sleeping_Bag", "Bag"];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, toString());
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Container(
        height: 100,
        width: 100.0,
        child: Card(
          color: Colors.red,
          child: Center(
            child: Text(query),
          ),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentProducts
        : products.where((p) => p.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
        },
        leading: Icon(Icons.card_travel),
        title: RichText(
          text: TextSpan(
              text: suggestionList[index].substring(0, query.length),
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: suggestionList[index].substring(query.length),
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                )
              ]),
        ),
      ),
      itemCount: suggestionList.length,
    );
  }
}
