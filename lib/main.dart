import 'dart:io';

import 'package:flutter/material.dart';
//import 'package:fyp/view/home.dart';
import 'package:fyp/view/homepage.dart';
import 'package:fyp/view/login.dart';
import 'package:fyp/view/signup.dart';
import 'package:fyp/view/splash.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
//import 'package:dlogin/signup.dart';
//import 'package:dlogin/homepage.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.blue,
      ),
      home: const SplashPage(),
      routes: {
        'signup': (context) => const SignUpPage(),
        'login': (context) => const LoginPage(),
        '/homepage': (context) => const HomePage(),
      },
    );
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
