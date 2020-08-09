import 'package:flutter/material.dart';
import '../Constants/result_content_page.dart';

class ResultPage extends StatefulWidget {
  ResultPage(this.finalCorrectAnswer, this.finalIncorrectAnswer,
      this.finalPercentText);

  final int finalCorrectAnswer;
  final int finalIncorrectAnswer;
  final String finalPercentText;

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {

  String correctString = 'Correct Answer: ';
  String incorrectString = 'In-Correct Answer: ';
  String percentString = 'Your Percentage'; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
        backgroundColor: Colors.grey[900],
        elevation: 10,
      ),
      backgroundColor: Colors.grey[900],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 10,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  'RESULT',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          ResultContentText(widget: widget, resultContentString: widget.finalCorrectAnswer.toString(), resultContentDesc: correctString,),
          ResultContentText(widget: widget, resultContentString: widget.finalIncorrectAnswer.toString(), resultContentDesc: incorrectString,),
          ResultContentText(widget: widget, resultContentString: widget.finalPercentText, resultContentDesc: percentString,),
          Divider(),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.green,
              child: RawMaterialButton(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'GO BACK',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}




// Expanded(
          //   child: Container(
          //     child: Text(
          //       'Incorrect Answer: ${}',
          //       style: TextStyle(
          //         color: Colors.white,
          //         fontSize: 20.0,
          //         fontWeight: FontWeight.bold,
          //       ),
          //       textAlign: TextAlign.center,
          //     ),
          //   ),
          // ),
          // Expanded(
          //   child: Container(
          //     child: Text(
          //       'Your Result: ${widget.finalPercentText}%',
          //       style: TextStyle(
          //         color: Colors.white,
          //         fontSize: 20.0,
          //         fontWeight: FontWeight.bold,
          //       ),
          //       textAlign: TextAlign.center,
          //     ),
          //   ),
          // ),