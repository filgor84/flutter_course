import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/answer.dart';
import './question.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final questions = const [
    {
      "question": 'What\'s your favorite color?',
      "answers": ["Red", "Green", "Blue"]
    },
    {
      "question": 'What\'s your favorite animal?',
      "answers": ["Cat", "Dog", "Rabbit"]
    },
    {
      "question": 'What\'s your favorite movie?',
      "answers": ["Jurassic Park", "Die Hard", "American Beauty"]
    },
  ];
  var _questionIndex = 0;

  void _answerQuestion() {
    if (_questionIndex < questions.length) {
      setState(() {
        _questionIndex = _questionIndex + 1;
      });
    } else {
      print("No more questions");
    }
    print("Question Answered!");
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Quiz App"),
        ),
        body: _questionIndex < questions.length
            ? Column(
                children: <Widget>[
                  Question(questions[_questionIndex]["question"]),
                  ...(questions[_questionIndex]["answers"] as List<String>)
                      .map((answer) {
                    return Answer(_answerQuestion, answer);
                  }).toList(),
                ],
              )
            : Center(
                child: Text("You did it!"),
              ),
      ),
    );
  }
}
