// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:adhd_proj/pages/login.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                    Color(0xFF38B697), // Darker color at the top
                  Color.fromARGB(255, 135, 229, 206), // Lighter color at the bottom
                ],
              ),
                image: DecorationImage(
                image: AssetImage("lib/images/GettingStarted.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: screenSize.height * 0.00001, // Adjust the position of the sticker image
            left: screenSize.width * 0.15,
            right: screenSize.width * 0.1,
            child: Center(
              child: Image.asset(
                "lib/images/sticker.png",
                width: screenSize.width * 0.98, // Adjust the width as needed
                height: screenSize.height * 0.66, // Adjust the height as needed
              ),
            ),
          ),
          Positioned(
            bottom: screenSize.height * 0.07, // Adjust the position of the texty image
            left: screenSize.width * 0.1,
            right: screenSize.width * 0.1,
            child: Center(
              child: Stack(
                children: [
                  Image.asset(
                    "lib/images/texty.png",
                    width: screenSize.width * 0.77, // Adjust the width as needed
                    height: screenSize.height * 0.4, // Adjust the height as needed
                  ),
                  Positioned(
                    bottom: screenSize.height * 0.05,
                    left: screenSize.width * 0.1,
                    right: screenSize.width * 0.1,
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () {
                            Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Login()));
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 3,
                          backgroundColor: Colors.white, // Set button color to green
                          padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.1, vertical: screenSize.height * 0.02), // Adjust button padding
                        ),
                        child: Text(
                          "Get Started",
                          style: TextStyle(
                            fontSize: screenSize.width * 0.05, // Adjust button text size
                            color: Color.fromRGBO(0, 145, 110, 1), // Set button text color to green
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      
      ),
    );
  }
}