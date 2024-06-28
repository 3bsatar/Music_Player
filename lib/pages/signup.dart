// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:adhd_proj/pages/DB_functions.dart';
import 'package:adhd_proj/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

CollectionReference collectionReference =
    FirebaseFirestore.instance.collection('users');
TextEditingController email = TextEditingController();
TextEditingController name = TextEditingController();
TextEditingController password = TextEditingController();
TextEditingController gender = TextEditingController();
TextEditingController age = TextEditingController();

void maketoast(String msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    String pattern =
        r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$';

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
                                  "Get Started Free",
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
                                Form(
                                  child: TextFormField(
                                    controller: email,
                                    decoration: InputDecoration(
                                      hintText: "yourname@gmail.com ",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide.none,
                                      ),
                                      fillColor:
                                          Color.fromARGB(57, 57, 158, 145),
                                      filled: true,
                                      constraints:
                                          const BoxConstraints(maxHeight: 55),
                                      prefixIcon: const Icon(Icons.email),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 250,
                                      bottom:
                                          2), // Adjust padding for left alignment
                                  child: Text("Name"),
                                ),
                                TextFormField(
                                  controller: name,
                                  decoration: InputDecoration(
                                    hintText: "@yourname",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide.none,
                                    ),
                                    fillColor: Color.fromARGB(57, 57, 158, 145),
                                    filled: true,
                                    constraints:
                                        const BoxConstraints(maxHeight: 55),
                                    prefixIcon: const Icon(Icons.person),
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
                                  controller: password,
                                  decoration: InputDecoration(
                                    hintText: "***********",
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
                                const SizedBox(
                                  height: 30,
                                  width: 30,
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 20),
                                      child: Text("Age"),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 165),
                                      child: Text("Gender"),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        controller: age,
                                        decoration: InputDecoration(
                                          hintText: "15",
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: BorderSide.none,
                                          ),
                                          fillColor: Color.fromARGB(57, 57, 158,
                                              145), // Set fill color to the hex code
                                          filled: true, // Enable fill behavior
                                          constraints: const BoxConstraints(
                                              maxHeight: 55),

                                          prefixIcon: const Icon(
                                              Icons.person_add_alt_sharp),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 50),
                                    Expanded(
                                      child: TextFormField(
                                        controller: gender,
                                        decoration: InputDecoration(
                                          hintText: "Male",
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: BorderSide.none,
                                          ),
                                          fillColor:
                                              Color.fromARGB(57, 57, 158, 145),
                                          filled: true,
                                          constraints: const BoxConstraints(
                                              maxHeight: 55),
                                          prefixIcon: const Icon(Icons.wc),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 40),
                                Container(
                                  padding:
                                      const EdgeInsets.only(top: 3, left: 3),
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      if (email.text.isEmpty ||
                                          name.text.isEmpty ||
                                          password.text.isEmpty ||
                                          age.text.isEmpty ||
                                          gender.text.isEmpty) {
                                        maketoast("please fill all fields");
                                      } else if (!RegExp(pattern)
                                          .hasMatch(email.text))
                                           {
                                        maketoast("wrong email format ");
                                          } else {
                                        if (await isDuplicateUniqueMale(
                                            email.text)) {
                                              maketoast("email address is already used");
                                        
                                        } else {
                                          collectionReference.add({
                                            'Email': email.text,
                                            'Name': name.text,
                                            'Password': password.text,
                                            'Gender': gender.text,
                                            'Age': age.text
                                          });
                                            maketoast("account registered successfully");
                                        
                                        }
                                      }
                                    },
                                    child: const Text(
                                      "Sign Up",
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
                                const Text("Already have an account?"),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Login()));
                                  },
                                  child: const Text(
                                    "Log In",
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
