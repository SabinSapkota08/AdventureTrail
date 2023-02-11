import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fyp/utils/user_credentials.dart';
import 'package:fyp/view/login.dart';
import 'package:fyp/view/navigation_page.dart';
import 'package:get/get.dart';
//import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    isLoggedIn();
  }

  final UserCredintials _credintials = UserCredintials();
  isLoggedIn() async {
    final storage = new FlutterSecureStorage();
    String? value = await storage.read(key: "token");
    if (value != null) {
      Get.off(MainNavigation());
    } else {
      Get.off(LoginPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        // body: Center(child: Image.asset("tent.gif")),
        );
  }
}
