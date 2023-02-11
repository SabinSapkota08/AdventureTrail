import 'package:flutter/material.dart';
import 'package:fyp/utils/validators.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  void initState() {
    super.initState();
    nameController.text = "Sabin Sapkota";
    phoneController.text = "+97798000000000";
    emailController.text = "sabin@gmail.com";
    setState(() {});
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final double devHeight = MediaQuery.of(context).size.height;
    final double devWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(height: devHeight * 0.1),
              const Text("Name"),
              TextFormField(
                readOnly: true,
                controller: nameController,
                validator: nameValidator,
                decoration: const InputDecoration(hintText: "Enter username"),
              ),
              const Text("Email Address"),
              TextFormField(
                readOnly: true,
                controller: emailController,
                validator: emailValidator,
                decoration: const InputDecoration(hintText: "Enter email"),
              ),
              //   const Text("Gender"),

              const Text("Phone"),
              TextFormField(
                readOnly: true,
                controller: phoneController,
                validator: phoneValidator,
                decoration:
                    const InputDecoration(hintText: "Enter phone number"),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 60,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Edit Profile"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
