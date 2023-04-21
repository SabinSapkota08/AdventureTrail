import 'package:flutter/material.dart';
import 'package:fyp/controller/login_controller.dart';
import 'package:fyp/utils/validators.dart';
import 'package:get/get.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String gender = "Male";
  changeGender(value) {
    gender = value;
    setState(() {});
  }

  bool visible = false;
  togglePassword() {
    visible = !visible;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: []),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: Center(
              child: Container(
                height: 500,
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView(
                      children: [
                        const Text(
                          "Current Password",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                        TextFormField(
                          obscureText: visible,
                          controller: passwordController,
                          validator: passwordValidator,
                          decoration: InputDecoration(
                            hintText: "Enter password",
                            suffixIcon: IconButton(
                              onPressed: togglePassword,
                              icon: Icon(visible
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "New Password",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                        TextFormField(
                          obscureText: visible,
                          // controller: passwordController,
                          validator: passwordValidator,
                          decoration: InputDecoration(
                            hintText: "Enter password",
                            suffixIcon: IconButton(
                              onPressed: togglePassword,
                              icon: Icon(visible
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Confirm Password",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                        TextFormField(
                          obscureText: visible,
                          // controller: passwordController,
                          validator: passwordValidator,
                          decoration: InputDecoration(
                            hintText: "Enter password",
                            suffixIcon: IconButton(
                              onPressed: togglePassword,
                              icon: Icon(visible
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        GetBuilder<LoginController>(
                          init: LoginController(),
                          // initState: (_) {},
                          builder: (controller) {
                            // return StreamBuilder<Object>(
                            //     stream: null,
                            //     builder: (context, snapshot) {
                            return ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  controller
                                      .login(
                                    usernameController.text.trim(),
                                    passwordController.text.trim(),
                                    context,
                                  )
                                      .then((value) {
                                    if (value != null) {
                                      Get.back();
                                    } else {
                                      print("error");
                                    }
                                  });
                                }
                              },
                              child: const Text("Change Password"),
                            );
                            //    });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
