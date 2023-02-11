import 'package:flutter/material.dart';

class TravelPackage extends StatefulWidget {
  const TravelPackage({Key? key}) : super(key: key);

  @override
  State<TravelPackage> createState() => _TravelPackageState();
}

class _TravelPackageState extends State<TravelPackage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(),
    );
  }
}
