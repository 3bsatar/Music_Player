// ignore_for_file: prefer_const_constructors

import 'package:adhd_proj/pages/DB_functions.dart';
import 'package:flutter/material.dart';
import 'globals.dart' as globals;

class QuestionPage extends StatefulWidget {
  const QuestionPage({Key? key}) : super(key: key);

  @override
  State<QuestionPage> createState() => _ProfilePageState();
}

int counter = 0;

class _ProfilePageState extends State<QuestionPage> {
  List<String> questions = [];
  Map<int, String?> selectedAnswers = {};
  @override
  void initState() {
    super.initState();
    loadQuestions();
  }

  void loadQuestions() async {
    List<String> loadedQuestions = await GetQuestions('questions', 'Question');
    setState(() {
      questions = loadedQuestions;  
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(25.0, 85.0, 30.0, 5.0),
            color:Color(0xFF54B6AB),
            child: Center(
              child: Text(
                'Questionnaire',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  'lib/images/back.png',
                  fit: BoxFit.fitWidth,
                  alignment: Alignment(-1, -1.01),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: const EdgeInsets.only(
                        bottom: 0.0000000000000000000000000002),
                    width: 340,
                    height: 730,
                    decoration: BoxDecoration(
                      
                      borderRadius: BorderRadius.circular(30.0),
                      color:Color.fromARGB(0, 84, 182, 171),
                    ),
                    padding: const EdgeInsets.all(2.0),
                    child: ListView.builder(
                      itemCount: questions.length + 1,
                      itemBuilder: (context, index) {
                        if (index == questions.length) {
                      // Last item, render the button
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF54B6AB), // Change this color to the desired color
                           minimumSize: Size(50, 45),
                          ), 
                          onPressed: () {
                            Addscorefield(globals.email, counter);
                          },
                          child: Text('Submit',  style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 254, 254, 254)),),
                          
                        ),
                      );
                    } else{
                            return QuestionCard(
                            question: questions[index],
                            selectedAnswer: selectedAnswers[index],
                            onChanged: (value) {
                              setState(() {
                                selectedAnswers[index] = value;
                              });
                            });
                    }
                        
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        
        ],
      ),
    );
  }
}

class QuestionCard extends StatefulWidget {
  final String question;
  final String? selectedAnswer;
  final ValueChanged<String?> onChanged;

  const QuestionCard(
      {Key? key,
      required this.question,
      required this.selectedAnswer,
      required this.onChanged})
      : super(key: key);

  @override
  _QuestionCardState createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard>with AutomaticKeepAliveClientMixin {
  String? _selectedAnswer;
  String? _previousAnswer;

@override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _selectedAnswer = widget.selectedAnswer;
  }
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Card(
      margin: EdgeInsets.all(8.0), // Adjust the spacing as needed
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              widget.question,
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold), // Adjusted for space
            ),
            SizedBox(height: 10.0), // Reduced space for compact design
            ...['ابدا', 'احيانا', 'كثيرا', 'كثيرا جدا']
                .map((answer) => RadioListTile<String>(
                      title: Text(answer,
                          style: TextStyle(
                              fontSize: 20.0)), // Adjust font size as necessary
                      value: answer,
                      groupValue: _selectedAnswer,
                      onChanged: (value) {
                        setState(() {
                          if (_previousAnswer != null) {
                            if (_previousAnswer == 'ابدا') {
                              counter -= 1;
                            } else if (_previousAnswer == 'احيانا') {
                              counter -= 2;
                            } else if (_previousAnswer == 'كثيرا') {
                              counter -= 3;
                            } else {
                              counter -= 4;
                            }
                          }
                          _selectedAnswer = value;
                          if (value == 'ابدا') {
                            counter += 1;
                          } else if (value == 'احيانا') {
                            counter += 2;
                          } else if (value == 'كثيرا') {
                            counter += 3;
                          } else {
                            counter += 4;
                          }
                          _previousAnswer = value;
                          print(counter);
                        });
                        
                      },
                      selected: _selectedAnswer == answer,
                    )),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Questionnaire',
      theme: ThemeData(
        primaryColor: Colors.blue,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: MaterialColor(
            0xFF54B6AB,
            <int, Color>{
              50: Color(0xFFE0F2F1),
              100: Color(0xFFB2DFDB),
              200: Color(0xFF80CBC4),
              300: Color(0xFF4DB6AC),
              400: Color(0xFF26A69A),
              500: Color(0xFF009688),
              600: Color(0xFF00897B),
              700: Color(0xFF00796B),
              800: Color(0xFF00695C),
              900: Color(0xFF004D40),
            },
          ),
          accentColor: Colors.green,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Color(0xFF5ED2B6),
            onPrimary: Colors.white,
          ),
        ),
      ),
      home: QuestionPage(),
    );
  }
}
