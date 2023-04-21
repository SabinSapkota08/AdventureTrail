import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(0),
          child: Column(
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image(
                    image: AssetImage("assets/images/pn.png"),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Sabin Gurung",
                style: Theme.of(context).textTheme.headline4,
              ),
              Text(
                "sabin@email.com",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    side: BorderSide.none,
                    shape: StadiumBorder(),
                  ),
                  child: Text("Edit profile",
                      style: TextStyle(color: Colors.black)),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
              ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.blueAccent.withOpacity(0.1),
                  ),
                  child: Icon(
                    Icons.settings,
                  ),
                ),
                title: Text(
                  "Settings",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:fyp/utils/validators.dart';
//
// class ProfilePage extends StatefulWidget {
//   const ProfilePage({super.key});
//
//   @override
//   State<ProfilePage> createState() => _ProfilePageState();
// }
//
// class _ProfilePageState extends State<ProfilePage> {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController phoneController = TextEditingController();
//
//   void initState() {
//     super.initState();
//     nameController.text = "Sabin Sapkota";
//     phoneController.text = "+97798000000000";
//     emailController.text = "sabin@gmail.com";
//     setState(() {});
//   }
//
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     final double devHeight = MediaQuery.of(context).size.height;
//     final double devWidth = MediaQuery.of(context).size.width;
//     return Scaffold(
//       body: Container(
//         margin: EdgeInsets.only(top: 30),
//         padding: EdgeInsets.symmetric(horizontal: 10),
//         child: Form(
//           key: _formKey,
//           child: ListView(
//             children: [
//               SizedBox(height: devHeight * 0.1),
//               const Text("Name"),
//               TextFormField(
//                 readOnly: true,
//                 controller: nameController,
//                 validator: nameValidator,
//                 decoration: const InputDecoration(hintText: "Enter username"),
//               ),
//               const Text("Email Address"),
//               TextFormField(
//                 readOnly: true,
//                 controller: emailController,
//                 validator: emailValidator,
//                 decoration: const InputDecoration(hintText: "Enter email"),
//               ),
//               //   const Text("Gender"),
//
//               const Text("Phone"),
//               TextFormField(
//                 readOnly: true,
//                 controller: phoneController,
//                 validator: phoneValidator,
//                 decoration:
//                     const InputDecoration(hintText: "Enter phone number"),
//               ),
//               SizedBox(
//                 height: 30,
//               ),
//               SizedBox(
//                 width: 60,
//                 child: ElevatedButton(
//                   onPressed: () {},
//                   child: Text("Edit Profile"),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
