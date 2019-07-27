import 'package:flutter/material.dart';


class Result extends StatelessWidget {

  final Function resetIndex;
  final int resultScore;
  
  Result({ 
    @required this.resetIndex,
    @required this.resultScore
  });

  String get resultPhrase {

    String resultText;
    if( resultScore <= 8 ) { resultText = 'You are innocent';}
    else if ( resultScore <= 12 ) { resultText = 'You are likeable';}
    else if ( resultScore <= 16 ) { resultText = 'You are ... strange';}
    else { resultText = 'You are aggresive';}
    return resultText;

  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        
        children: <Widget>[

          Text(
            resultPhrase, 
            style: TextStyle(
              fontSize: 26, 
              fontWeight: FontWeight.bold,
              ),
            textAlign: TextAlign.center,
          ),

        FlatButton(
          color: Colors.lightGreen[300],
          textColor: Colors.white,
          child: Text('Ask again ... '), 
          onPressed: resetIndex,
          
        ),
        
        ],
      )
        
       
    );

  }
}