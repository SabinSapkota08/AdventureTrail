import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fyp/utils/user_credentials.dart';
import 'package:fyp/view/login_page.dart';
import 'package:fyp/view/splash_screen_page.dart';
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
    showNotification();

    isLoggedIn();
  }

  final UserCredintials _credintials = UserCredintials();
  isLoggedIn() async {
    final storage = new FlutterSecureStorage();
    String? value = await storage.read(key: "token");
    if (value != null) {
      Get.off(SplashScreen());
    } else {
      Get.off(MyLogin());
    }
  }

  Future<void> showNotification() async {
    FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;

    var androidDetails = AndroidNotificationDetails(
      'channelId',
      'channelName',
      'channelDescription',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );
    var iosDetails = IOSNotificationDetails();
    var generalNotificationDetails =
        NotificationDetails(android: androidDetails, iOS: iosDetails);
    await flutterLocalNotificationsPlugin?.show(
      0,
      'Notification Title',
      'Notification Body',
      generalNotificationDetails,
      payload: 'Notification Payload',
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        // body: Center(child: Image.asset("tent.gif")),
        );
  }
}
