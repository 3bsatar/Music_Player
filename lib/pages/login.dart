// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last, non_constant_identifier_names, use_build_context_synchronously

import 'package:adhd_proj/pages/DB_functions.dart';
import 'package:adhd_proj/pages/home1.dart';
import 'package:adhd_proj/pages/signup.dart';
import 'package:flutter/material.dart';
import 'globals.dart' as globals;

TextEditingController email_text = TextEditingController();
TextEditingController password_text = TextEditingController();


class Login extends StatelessWidget {
  const Login({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 59, 192, 161), // Darker color at the top
                  Color(0xFF7EDDC6), // Lighter color at the bottom
                ],
              ),
              image: DecorationImage(
                image: AssetImage("lib/images/signup.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 22,
                  ),
                  Padding(
                    padding: EdgeInsets.all(60),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[],
                    ),
                  ),
                  // Assuming the container is the Expanded one with rounded corners
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(167, 255, 255, 255),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(35),
                            topRight: Radius.circular(35)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                const Text(
                                  "Welcome Back",
                                  style: TextStyle(
                                    fontSize: 37,
                                    color: Color(0xFF0E3D31),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 20),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 200,
                                      bottom:
                                          2), // Adjust padding for left alignment
                                  child: Text("Email Address"),
                                ),
                                TextFormField(
                                  controller: email_text,
                                  decoration: InputDecoration(
                                    hintText: "yourname@gmail.com ",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide.none,
                                    ),
                                    fillColor: Color.fromARGB(57, 57, 158, 145),
                                    filled: true,
                                    constraints:
                                        const BoxConstraints(maxHeight: 55),
                                    prefixIcon: const Icon(Icons.email),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 227,
                                      bottom:
                                          2), // Adjust padding for left alignment
                                  child: Text("password"),
                                ),
                                TextFormField(
                                  controller: password_text,
                                  decoration: InputDecoration(
                                    hintText: "*****",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide.none,
                                    ),
                                    fillColor: Color.fromARGB(57, 57, 158, 145),
                                    filled: true,
                                    constraints:
                                        const BoxConstraints(maxHeight: 55),
                                    prefixIcon: const Icon(Icons.key_outlined),
                                  ),
                                  obscureText: true,
                                ),
                                const SizedBox(height: 40),
                                Container(
                                  padding:
                                      const EdgeInsets.only(top: 3, left: 3),
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      Map<String, dynamic>? documentData =
                                          await getDocumentByEmail(
                                              email_text.text);
                                        if(email_text.text.isEmpty||password_text.text.isEmpty)
                                        {
                                          maketoast("please fill all fields");
                                        }
                                        else{
                                         if (documentData != null) {
                                          if (documentData['Password'] ==
                                            password_text.text) {
                                          globals.name = documentData['Name'];
                                          globals.email = documentData['Email'];
                                          globals.password =
                                              documentData['Password'];
                                          globals.age = documentData['Age'];
                                          globals.gender =
                                              documentData['Gender'];

                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => Home(),
                                            ),
                                          );
                                        } else {
                                          maketoast("Incorrect password");
                                        }
                                      } else {
                                        maketoast("Incorrect Email Address");
                                      }
                                    }
                                    },
                                    child: const Text(
                                      "Log In",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Color.fromARGB(
                                              255, 14, 151, 119)),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      shape: const StadiumBorder(),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12),
                                      backgroundColor: Colors.white,
                                      minimumSize: Size(250,
                                          10), // Replace with your desired width and height
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Text("Don't have an account?"),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Signup()));
                                  },
                                  child: const Text(
                                    "SignUp",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 14, 151, 119)),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
