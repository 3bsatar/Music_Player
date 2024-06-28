import 'package:adhd_proj/pages/DB_functions.dart';
import 'package:adhd_proj/pages/home1.dart';
import 'package:adhd_proj/pages/signup.dart';
import 'package:flutter/material.dart';
import 'globals.dart' as globals;

class Edit extends StatefulWidget {
  const Edit({Key? key}) : super(key: key);

  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    ageController.dispose();
    genderController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    nameController.text = globals.name;
    emailController.text = globals.email;
    ageController.text = globals.age;
    genderController.text = globals.gender;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int selectedIndex = 2;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'lib/images/back.png',
            fit: BoxFit.fitWidth,
            alignment: Alignment(-1, -0.998),
          ),

          // Text for editing profile on the back image
          Positioned(
            top: 120,
            left: 118,
            child: Text(
              'Edit Your Profile',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin:
                  const EdgeInsets.only(bottom: 0.0000000000000000000000000002),
              width: 300,
              height: 550,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 112, 112, 112).withOpacity(0.1),
                    blurRadius: 6.0,
                    spreadRadius: 2.0,
                  ),
                ],
                borderRadius: BorderRadius.circular(16.0),
                color: Colors.white.withOpacity(1.0),
              ),
              padding: const EdgeInsets.all(16.0),
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 58,
                    child: SizedBox(
                      width: 150,
                      height: 150,
                      child: Image.asset('lib/images/avatar.png'),
                    ),
                  ),

                  // Button for editing profile
                  Positioned(
                    bottom: 32,
                    right: 28,
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        updateInfo(
                            globals.email,
                            emailController.text,
                            nameController.text,
                            genderController.text,
                            ageController.text);

                        globals.email = emailController.text;
                        globals.name = nameController.text;
                        globals.age = ageController.text;
                        globals.gender = genderController.text;
                        maketoast('info updated successefully');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(156, 47, 234, 212),
                      ),
                      child: Text(
                        'Edit Profile',
                        style: TextStyle(
                            fontSize: 16.0,
                            color: const Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 160.0,
                    left: 35.0,
                    child: _buildTextBoxWithLabel(
                      'Name',
                      nameController,
                      width: 210,
                      height: 50,
                    ),
                  ),
                  Positioned(
                    top: 245.0,
                    left: 35.0,
                    child: _buildTextBoxWithLabel(
                      'Email',
                      emailController,
                      width: 210,
                      height: 50,
                    ),
                  ),
                  Positioned(
                    top: 330.0,
                    left: 35.0,
                    child: _buildTextBoxWithLabel(
                      'Age',
                      ageController,
                      width: 80,
                      height: 50,
                    ),
                  ),
                  Positioned(
                    top: 330.0,
                    left: 160.0,
                    child: _buildTextBoxWithLabel(
                      'Gender',
                      genderController,
                      width: 85,
                      height: 50,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(80),
            topRight: Radius.circular(80),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, -1), // changes position of shadow
            ),
          ],
          border: Border(
            top: BorderSide(
              style: BorderStyle.solid,
              color: Colors.grey.withOpacity(0.1),
              width: 2.0, // Set the width of the border
            ),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          selectedItemColor: Color.fromARGB(255, 94, 210, 182),
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
              //Navigate to add page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Home(),
                ),
              );
            } else if (selectedIndex == 2) {
              // Navigate to profile page
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) =>Edit(),
              //   ),
              // );
            }
          },
          items: [
            BottomNavigationBarItem(
              label: '',
              icon: Icon(Icons.settings),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(Icons.add),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(Icons.person),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextBoxWithLabel(
    String label,
    TextEditingController controller, {
    double width = 200,
    double height = 30,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
        ),
        SizedBox(height: 5.0),
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Color.fromARGB(255, 242, 242, 242),
          ),
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: TextFormField(
            controller: controller,
            style: TextStyle(fontSize: 16.0),
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
