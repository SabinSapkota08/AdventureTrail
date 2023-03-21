import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fyp/state/order_controller.dart';
//import 'package:fyp/view/home.dart';
import 'package:fyp/view/homepage.dart';
import 'package:fyp/view/login.dart';
import 'package:fyp/view/signup.dart';
import 'package:fyp/view/splash.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
//import 'package:dlogin/signup.dart';
//import 'package:dlogin/homepage.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();

  Get.put(ProductStateController());
  ;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return KhaltiScope(
        publicKey: "test_public_key_a5131ab1093d404b83b9416c1b18e00e",
        builder: (context, navigatorKey) {
          return GetMaterialApp(
            navigatorKey: navigatorKey,
            supportedLocales: const [
              Locale('en', 'US'),
              Locale('ne', 'NP'),
            ],
            localizationsDelegates: const [
              KhaltiLocalizations.delegate,
            ],
            home: const SplashPage(),
            routes: {
              'signup': (context) => const SignUpPage(),
              'login': (context) => const LoginPage(),
              '/homepage': (context) => const HomePage(),
            },
          );
        });
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
