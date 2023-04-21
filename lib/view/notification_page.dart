import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(""),
              

            ),
            title: Text("Your order is placed"),
            //subtitle: Text("It is a notification"),
            
            
          ),

            ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(""),
              

            ),
            title: Text("Your order is placed"),
            //subtitle: Text("It is a notification"),
            
            
          ),

        ],
      ),
    );
  }
}
