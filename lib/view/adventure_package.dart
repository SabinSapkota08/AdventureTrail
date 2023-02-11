import 'package:flutter/material.dart';
import 'package:fyp/controller/adventure_packages_controller.dart';
import 'package:fyp/model/adventure_packages_model.dart';

import 'ad_post_screen.dart';

class AdventurePackagePage extends StatefulWidget {
  const AdventurePackagePage({super.key});

  @override
  State<AdventurePackagePage> createState() => _AdventurePackagePageState();
}

class _AdventurePackagePageState extends State<AdventurePackagePage> {
  @override
  List<AdPackage> packages = [];

  void initState() {
    super.initState();
    AdventurePackageController().get().then((value) {
      packages = value?.packages ?? [];
      print(packages.length);
      setState(() {});
    });
  }

  Widget build(BuildContext context) {
    var category = [
      'Best Places',
      'Most Visited',
      'Favourites',
      'New Added',
      'Company',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 200,
                    child: ListView.builder(
                      itemCount: 6,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AdPostScreen(
                                        adPackage: packages[index],
                                      )),
                            );
                          },
                          child: Container(
                            width: 160,
                            padding: EdgeInsets.all(20),
                            margin: EdgeInsets.only(left: 15),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/background.png"),
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
                                    "Machapuchare Trek",
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
              height: 20,
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
                          ),
                        ),
                      )
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: packages.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AdPostScreen(
                                      adPackage: packages[index],
                                    )),
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "https://www.thirdrockadventures.com/assets-back/images/trip/mardi-himal-trek.jpggTW.jpg",
                                      scale: 2),
                                  fit: BoxFit.cover,
                                  opacity: 0.8,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              packages[index].name ?? "",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Icon(
                              Icons.more_vert,
                              size: 30,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 20,
                          ),
                          Text(
                            "3.5",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

//child: Scaffold(
//  backgroundColor: Colors.white,
// appBar: AppBar(
//   backgroundColor: Colors.transparent,
//   title: Text(""),
// ),
// body: SingleChildScrollView(
//   child: Container(
//     // decoration: BoxDecoration(
//     //   image: DecorationImage(
//     //     image: AssetImage("assets/images/background.png"),
//     //     fit: BoxFit.cover,
//     //     opacity: 0.7,
//     //   ),
//     // ),
//     margin: EdgeInsets.only(top: 30),
//     padding: const EdgeInsets.symmetric(vertical: 27, horizontal: 16),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         SizedBox(
//           height: 2,
//         ),
//
//
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             const Text(
//               "Most Popular",
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//             ),
//             TextButton(
//               onPressed: () {},
//               child: const Text(
//                 "See more",
//                 style: TextStyle(
//                   fontWeight: FontWeight.normal,
//                   fontSize: 12.83,
//                 ),
//               ),
//             )
//           ],
//         ),
//
//         Stack(
//           children: [
//             Image.network(
//               "https://images.pexels.com/photos/15286/pexels-photo.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
//             ),
//             Positioned.fill(
//                 child: Align(
//               alignment: Alignment.centerLeft,
//               child: Text("Annapurna himal trek",
//                   style: TextStyle(color: Colors.white, fontSize: 30)),
//             )),
//             Positioned.fill(
//                 child: Align(
//               alignment: Alignment.bottomLeft,
//               child: Text("Nrs.45",
//                   style: TextStyle(color: Colors.white, fontSize: 18)),
//             )),
//           ],
//         ),
//
//         Container(
//           height: 290,
//           margin: EdgeInsets.only(top: 10),
//           decoration: BoxDecoration(
//             color: Colors.red,
//             borderRadius: BorderRadius.circular(18),
//             image: DecorationImage(
//               fit: BoxFit.fill,
//               image: NetworkImage(
//                   "https://images.pexels.com/photos/15286/pexels-photo.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
//             ),
//           ),
//         ),
//
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               "Mardi Himal Trek",
//               style: TextStyle(
//                 fontWeight: FontWeight.w600,
//                 fontSize: 17.1,
//               ),
//             ),
//             Text(
//               "Rs. 2.5..00 / Day",
//               style: TextStyle(
//                 fontWeight: FontWeight.normal,
//                 color: Color(0xfff0A8ED9),
//                 fontSize: 12.83,
//               ),
//             )
//           ],
//         ),
//
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               "This is small cozy tent for two peoples. ",
//               style: TextStyle(
//                 fontWeight: FontWeight.normal,
//                 fontSize: 12.83,
//               ),
//             ),
//             ElevatedButton(onPressed: () {}, child: Text("Book"))
//           ],
//         ),
//         Container(
//           height: 290,
//           margin: EdgeInsets.only(top: 10),
//           decoration: BoxDecoration(
//               color: Colors.red,
//               borderRadius: BorderRadius.circular(18),
//               image: DecorationImage(
//                   fit: BoxFit.fill,
//                   image: NetworkImage(
//                       "https://images.pexels.com/photos/15286/pexels-photo.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"))),
//         ),
//
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               "Mardi Himal Trek",
//               style: TextStyle(
//                 fontWeight: FontWeight.w600,
//                 fontSize: 17.1,
//               ),
//             ),
//             Text(
//               "Rs. 2.5..00 / Day",
//               style: TextStyle(
//                 fontWeight: FontWeight.normal,
//                 color: Color(0xfff0A8ED9),
//                 fontSize: 12.83,
//               ),
//             )
//           ],
//         ),
//
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               "This is small cozy tent for two peoples. ",
//               style: TextStyle(
//                 fontWeight: FontWeight.normal,
//                 fontSize: 12.83,
//               ),
//             ),
//             ElevatedButton(onPressed: () {}, child: Text("Book"))
//           ],
//         ),
//       ],
//     ),
//   ),
// ),

//);
// }
