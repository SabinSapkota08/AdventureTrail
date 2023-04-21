import 'dart:io';

//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:dlogin/signup.dart';
//import 'package:dlogin/homepage.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fyp/state/order_controller.dart';
//import 'package:fyp/view/home.dart';
import 'package:fyp/view/homepage.dart';
import 'package:fyp/view/login_page.dart';
import 'package:fyp/view/signUp_page.dart';
import 'package:fyp/view/splash_screen_page.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

void main() async {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  WidgetsFlutterBinding.ensureInitialized();
  var initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  var initializationSettingsIOS = IOSInitializationSettings();
  var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
  );

  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  HttpOverrides.global = MyHttpOverrides();

  Get.put(ProductStateController());

  // clear();
  runApp(const MyApp());
}

Future<void> clear() async {
  final storage = new FlutterSecureStorage();
  await storage.delete(key: "token");
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
            home: SplashScreen(),
            routes: {
              'register': (context) => const MyRegister(),
              'login': (context) => const MyLogin(),
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
