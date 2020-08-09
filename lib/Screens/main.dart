import 'package:flutter/material.dart';
import '../Constants/questionnaire.dart';
import 'result_page.dart';

Questionnaire questionnaire = Questionnaire();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  int finalCorrectAnswer = 0;
  int finalIncorrectAnswer = 0;

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = questionnaire.getCorrectAnswer();
    setState(() {
      if (questionnaire.isFinished() == true) {
        String finalPercentText =
            (questionnaire.finalPercentage(finalCorrectAnswer)).toStringAsFixed(1);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultPage(
                finalCorrectAnswer, finalIncorrectAnswer, finalPercentText),
          ),
        );

        questionnaire.reset();

        scoreKeeper = [];
      } else {
        if (userPickedAnswer == correctAnswer) {
          scoreKeeper.add(
            Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
          finalCorrectAnswer++;
        } else {
          scoreKeeper.add(
            Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
          finalIncorrectAnswer++;
        }
      }
      questionnaire.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questionnaire.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.green,
              onPressed: () {
                checkAnswer(true);
              },
              child: Text(
                'TRUE',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              onPressed: () {
                checkAnswer(false);
              },
              child: Text(
                'FALSE',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}