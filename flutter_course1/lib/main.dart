import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    //throw UnimplementedError();
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Lion', 'score': 10},
        {'text': 'Cheetah', 'score': 11},
        {'text': 'Horse', 'score': 5},
        {'text': 'Rabbit', 'score': 3},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;
  
  void _resetQuiz(){
    
       setState(() {
       _questionIndex = 0;
    _totalScore = 0;
    });
   
  }

  void _answerQuestion(int score) {
    //var aBool = true;
    //aBool = false;-

    _totalScore += score;

    setState(() {       // function method 
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more question');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    //var dummy = ['Hello'];
    //dummy.add('Max');
    //print(dummy);

    //question = [];  does not work if questions is a const
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
