import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AtPostAppBar extends StatefulWidget {
  AtPostAppBar({Key? key}) : super(key: key);

  @override
  State<AtPostAppBar> createState() => _AtPostAppBarState();
}

class _AtPostAppBarState extends State<AtPostAppBar> {
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
            onTap: () {},
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
              child: IconButton(
                color: Colors.red,
                onPressed: changeFavourite,
                icon: Icon(
                  isFavourite ? Icons.favorite : Icons.favorite_outline,
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
