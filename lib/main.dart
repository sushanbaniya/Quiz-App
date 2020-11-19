import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

import './question.dart'; 
import './answer.dart';
import './quiz.dart';
import './result.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
  @override 
  State<StatefulWidget> createState(){
  return _MyAppState();
  } 
}

class _MyAppState extends State <MyApp>{

  final _questions = const [
      
      {
        'questionText': 'What\'s your favorite Color ?',
        'answers': [{
          'text':'Pink', 'score': 10
          }, 
          {
          'text':'Blue', 'score': 5
          },  {
          'text':'White', 'score': 3
          },  {
          'text':'Orange', 'score': 1
          }, ]
      },

      {
        'questionText': 'Who is you favorite Celebrity ?',
        'answers': [{
          'text':'Samay Raina', 'score': 10
          },  {
          'text':'Aakash Gupta', 'score': 5
          },  {
          'text':'Tony Toutouni', 'score': 3
          },  {
          'text':'Sidharth Shukla', 'score': 1
          }, ]
      },

      {
        'questionText': 'Who is Prettier ?',
        'answers': [{
          'text':'Preity Zinta', 'score': 10
          },  {
          'text':'Stephanie Ruiz', 'score': 5
          },  {
          'text':'Amrita Rao', 'score': 3
          },  {
          'text':'Alia Bhatt', 'score': 1
          }, ]
      }
      ];
  var _questionIndex = 0;
  int _totalscore =0;

  void _resetQuiz(){
    setState((){
      _questionIndex = 0;
      _totalscore = 0;
    });
  }

  
  


  void _answerQuestion(int score){

    _totalscore += score;
    setState((){
    _questionIndex = _questionIndex + 1;
    

  });
    
   
  }
  @override 
  Widget build(BuildContext context){
    

      
      
    


    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('This is my Bar.'),
        ),
        body: _questionIndex < _questions.length ? 
        Quiz(
          questionIndex: _questionIndex,
          answerQuestion: _answerQuestion,
          questions: _questions
        )
         : Result(_totalscore, _resetQuiz),
      ),

      
     );
  }
}