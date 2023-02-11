//import 'package:fp/utils/user_credentials.dart';
import 'package:flutter/material.dart';
import 'package:fyp/controller/login_controller.dart';
import 'package:fyp/utils/validators.dart';
import 'package:fyp/view/homepage.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
    final double devHeight = MediaQuery.of(context).size.height;
    final double devWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('/assets/images/background.png'),
        ),
      ),
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Login"),
          ),
          body: SingleChildScrollView(
            child: Column(
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
                              Center(
                                child: Container(
                                  width: 200,
                                  height: 150,
                                  /*decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(50.0)),*/
                                  child: Image.asset(
                                    "asset/images/background.png",
                                    height: 20,
                                    width: 20,
                                  ),
                                ),
                              ),
                              // Image.network(
                              //     "https://img.freepik.com/free-vector/mobile-login-concept-illustration_114360-135.jpg?w=2000"),
                              const Text("Email"),
                              TextFormField(
                                controller: usernameController,
                                validator: nameValidator,
                                decoration: const InputDecoration(
                                    hintText: "Enter username"),
                              ),
                              const SizedBox(height: 10),
                              const Text("Password"),
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
                              // const Text("Confirm Password"),
                              // TextFormField(
                              //   obscureText: visible,
                              //   validator: (value) {
                              //     if (value != passwordController.text) {
                              //       return "Password didn't match";
                              //     }
                              //     return null;
                              //   },
                              //   decoration: const InputDecoration(hintText: "Enter password"),
                              // ),
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
                                            Get.off(HomePage());
                                          } else {
                                            print("error");
                                          }
                                        });
                                      }
                                    },
                                    child: const Text("Login"),
                                  );
                                  //    });
                                },
                              ),
                              Wrap(
                                children: [
                                  const Text("Dont have an account?"),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pushNamed(context, "signup");
                                      },
                                      child: const Text(
                                        "Sign Up",
                                        style: TextStyle(color: Colors.red),
                                      ))
                                ],
                                crossAxisAlignment: WrapCrossAlignment.center,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
