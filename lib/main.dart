import 'package:claculater/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  String? answare = 'answare' ;
  String? qwastion= 'qwastion' ;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userQuestion = '' ;
  var userAnswer = '' ;
  final List<String> bottons = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    'x',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'ANS',
    '='
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Column(
        children: [
          Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        alignment: Alignment.topLeft,
                          child: Text(userQuestion, style: TextStyle(
                            fontSize: 20
                          ),)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        alignment: Alignment.bottomRight,
                          child: Text(userAnswer, style: TextStyle(
                              fontSize: 20 ))),
                    ),
                  ],
                ),
              ),
              flex: 1),
          Expanded(
            flex: 3,
            child: Container(
              child: GridView.builder(
                  itemCount: bottons.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemBuilder: (context, index) {
                    //Clear Button
                    if(index == 0){
                      return MyButton(
                        onTap: (){
                          setState(() {
                            userQuestion = '' ;
                          });
                        },
                        color: Colors.green,
                        text: bottons[index],
                        textcolor: Colors.white,
                      );
                    }
                    //Delete Button
                    else if (index == 1) {

                      return MyButton(
                        onTap: (){
                          setState(() {
                            userQuestion = userQuestion.substring(0, userQuestion.length -1);
                          });
                        },
                        color: Colors.red,
                        text: bottons[index],
                        textcolor: Colors.white,
                      );
                    }
                    //Equal Button
                    else if (index == bottons.length-1) {

                      return MyButton(
                        onTap: (){
                          setState(() {
                            equalPressed();
                          });
                        },
                        color: Colors.deepPurple,
                        text: bottons[index],
                        textcolor: Colors.white,
                      );
                    }
                    else {

                      return MyButton(
                        onTap: (){
                          setState(() {
                            userQuestion+=bottons[index];
                          });
                        },
                        color: isOperator(bottons[index]) ? Colors.purple : Colors.deepPurple[50],
                        text: bottons[index],
                        textcolor:isOperator(bottons[index]) ? Colors.white : Colors.deepPurple,
                      );

                    }

                  }),
            ),
          )
        ],
      ),
    );
  }

  bool isOperator(String char) {
    if(char == '%' || char == '/' || char == 'x' || char == '-' ||char == '+' ||char == '=' ){
      return true;
    }
    return false;
  }
  void equalPressed () {
    String finalQuestion = userQuestion;
    finalQuestion = finalQuestion.replaceAll('x', '*');
    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm) ;
    userAnswer = eval.toString();

    }
}
