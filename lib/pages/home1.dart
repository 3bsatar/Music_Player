// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, prefer_interpolation_to_compose_strings

import 'package:adhd_proj/pages/Editprofile.dart';
import 'package:adhd_proj/pages/questions.dart';
import 'package:flutter/material.dart';
import 'globals.dart' as globals;

void main() {
  runApp(Home());
}

int selectedIndex = 0;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String activitiesText =
          "Measuring variety of your skills and Explore your character more.\n -Feel comfortable and answers as who you really are.";
  String selectedLabel = "";

  @override
  void initState() {
    super.initState();
    selectedLabel = "MCQ Test";
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Center(
                child: Text(
                  "Hello " + globals.name,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        "lib/images/Home1.png",
                        height: 180,
                        width: 180,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Text(
                        "Embark on your ADHD journey with our test Now!",
                        style: TextStyle(
                          fontSize: 19,
                          color: Color.fromARGB(255, 59, 127, 110),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  padding: EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        "ADHD Detection Test",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: 17.0), // Adjust the value as needed
                            child: IconText(
                              icon: Icons.check_circle_outline_outlined,
                              label: "MCQ Test",
                              isSelected: selectedLabel == "MCQ Test",
                              onTap: () {
                                setState(() {
                                  activitiesText =
                                      "Measuring variety of your skills and Explore your character more.\n -Feel comfortable and answers as who you really are.";
                                  selectedLabel = "MCQ Test";
                                });
                              },
                            ),
                          ),
                          IconText(
                            icon: Icons.psychology_rounded,
                            label: "Activities",
                            isSelected: selectedLabel == "Activities",
                            onTap: () {
                              setState(() {
                                activitiesText =
                                    "Measuring your concentration level with enjoyable activities.\n -Make sure you are in a quiet place.";
                                selectedLabel = "Activities";
                              });
                            },
                          ),
                          IconText(
                            icon: Icons.videocam_outlined,
                            label: "Video Recording",
                            isSelected: selectedLabel == "Video Recording",
                            onTap: () {
                              setState(() {
                                activitiesText =
                                    "Measuring your concentration level.\n-Sit in a white background\n-Don’t wear glasses.\n-Don’t record in the Dark";
                                selectedLabel = "Video Recording";
                              });
                            },
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Text(
                          selectedLabel ?? "",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                              color: Color.fromARGB(255, 176, 175, 175)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: activitiesText.split('\n').map((line) {
                                return Text(
                                  line,
                                  style:
                                      line == activitiesText.split('\n').first
                                          ? TextStyle(
                                              fontSize: 18,
                                              color: Colors.grey,
                                            )
                                          : TextStyle(
                                              fontSize: 18,
                                              color: Colors.black,
                                            ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => QuestionPage(),
                                ));
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white, 
                            backgroundColor: Color.fromARGB(255, 94, 193, 170),
                            padding: EdgeInsets.symmetric(
                                horizontal: 60, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text(
                            'Take ADHD Test',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            border: Border(
              top: BorderSide(
                color: Colors.grey.withOpacity(0.5),
                width: 2.0, // Set the width of the border
              ),
            ),
          ),
          child: BottomNavigationBar(
            currentIndex: selectedIndex,
            selectedItemColor: Color(0xFF5ED2B6),
            selectedFontSize: 0,
            unselectedFontSize: 0,
            onTap: (index) {
              selectedIndex = index;
              // Perform navigation based on the selected item
              if (selectedIndex == 0) {
                // // Navigate to settings page
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => Edit(),
                //   ),
                // );
              } else if (selectedIndex == 1) {
                // Navigate to add page
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => Signup(),
                //   ),
                // );
              } else if (selectedIndex == 2) {
                // Navigate to profile page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Edit(),
                  ),
                );
              }
            },
            items: [
              BottomNavigationBarItem(
                label: '',
                icon: CircularIcon(
                    icon: Icons.settings, size: 40, colored: false),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: CircularIcon(icon: Icons.add, size: 40, colored: true),
              ),
              BottomNavigationBarItem(
                label: '',
                icon:
                    CircularIcon(icon: Icons.person, size: 40, colored: false),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IconText extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final Function() onTap;

  const IconText(
      {Key? key,
      required this.icon,
      required this.label,
      required this.isSelected,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(
            icon,
            size: 40,
            color: isSelected
                ? Color(0xFF5ED2B6)
                : null, // Change color to green when selected
          ),
          Text(
            label,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isSelected
                    ? Color(0xFF5ED2B6)
                    : null), // Change text color to green when selected
          ),
        ],
      ),
    );
  }
}

class CircularIcon extends StatelessWidget {
  final IconData icon;
  final double size;
  final bool colored;

  const CircularIcon(
      {Key? key, required this.icon, required this.size, required this.colored})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        padding: EdgeInsets.all(15),
        color: colored ? Color(0xFF5ED2B6) : Colors.transparent,
        child: Icon(
          icon,
          size: size,
          color: colored ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
