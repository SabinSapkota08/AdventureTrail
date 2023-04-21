import 'package:fyp/controller/login_controller.dart';
import 'package:fyp/utils/validators.dart';
import 'package:flutter/material.dart';
//import 'package:dlogin/login.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fyp/view/homepage.dart';
import 'package:fyp/view/login.dart';
import 'package:get/get.dart';


class SignUpPage extends StatefulWidget {
   const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}
class _SignUpPageState extends State<SignUpPage>{

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String gender = "Male";
  changeGender(value) {
    gender = value;
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    final double devHeight = MediaQuery.of(context).size.height;
    final double devWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        
        title: const Text("Signup"),
      ),
    
     body: Form(
        key: _formKey,
        child: ListView(
          children: [
            SizedBox(height: devHeight * 0.1),
            const Text("Name"),
            TextFormField(
               controller: nameController,
               validator: nameValidator,
              decoration: const InputDecoration(hintText: "Enter username"),
            ),
            const Text("Email Address"),
            TextFormField(
               controller: emailController,
               validator: emailValidator,
              decoration: const InputDecoration(hintText: "Enter email"),
            ),
         //   const Text("Gender"),


            const Text("Phone"),
            TextFormField(
               controller: phoneController,
              validator: phoneValidator,
              decoration: const InputDecoration(hintText: "Enter phone number"),
            ),
            const Text("Password"),
            TextFormField(
               controller: passwordController,
              validator: passwordValidator,
              obscureText: true,
              decoration: const InputDecoration(hintText: "Enter password"),
            ),
            const Text("Confirm Password"),
            TextFormField(
              controller: confirmPasswordController,
              validator: confirmPasswordValidator,
              obscureText: true,
              decoration: const InputDecoration(hintText: "Enter  confirm password"),
            ),

            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()){
                  LoginController().register(email: emailController.text, password: passwordController.text, name: nameController.text, confirm_password: passwordController.text, phone_number: phoneController.text).then((value) {
                    if(value != null){
                      Get.off(LoginPage());


                    }
                  });
                }
              },
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
