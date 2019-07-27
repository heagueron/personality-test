import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}


class _MyAppState extends State<MyApp> {
 
  
  final _questions = const [
      {
        'questionText': 'What\'s your favorite color?',
        'answers': [
          {'text': 'Black', 'score': 10,}, 
          {'text': 'Red', 'score': 5,}, 
          {'text': 'Green', 'score': 3,},
          {'text': 'White', 'score': 1,},
        ]
      },
      {
        'questionText': 'What\'s your favorite pet?',
        'answers': [
          {'text': 'Bear', 'score': 10,}, 
          {'text': 'Wolf', 'score': 5,}, 
          {'text': 'Bull', 'score': 3,},
          {'text': 'Dog', 'score': 1,},
        ]
      },
      {
        'questionText': 'What\'s your favorite hero?',
        'answers': [
          {'text': 'Batman', 'score': 10,}, 
          {'text': 'Aquaman', 'score': 5,}, 
          {'text': 'Chapulin', 'score': 3,},
          {'text': 'Winnie Pooh', 'score': 1,},
        ]
      },
      {
        'questionText': 'What\'s your favorite dessert?',
        'answers': [
          {'text': 'Chile', 'score': 10,}, 
          {'text': 'Casabe', 'score': 5,}, 
          {'text': 'Cake', 'score': 3,},
          {'text': 'Ice Cream', 'score': 1,},
        ]
      },

    ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion( int score ) {

    _totalScore += score;
  
    if (_questionIndex < _questions.length ) {

      print("We have more questions ... ");
      setState(() {
        _questionIndex = _questionIndex + 1;
      });
      
    } else {
      print('No more questions');      
    }

    print(_questionIndex);

  }

  void _resetIndex() {
    setState(() {
        _questionIndex = 0;
        _totalScore = 0;
      });
  }
  
  @override
  Widget build( BuildContext context ) {
    
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hector Flutter'),
        ),

        body: _questionIndex < _questions.length 
          ? Quiz(
              answerQuestion: _answerQuestion, 
              questions: _questions,
              questionIndex: _questionIndex
            )
          : Result( 
              resetIndex: _resetIndex,
              resultScore: _totalScore,
            ),
      ),
    );
  }

} 