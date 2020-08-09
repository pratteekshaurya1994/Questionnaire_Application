import 'package:flutter/material.dart';
import '../Screens/result_page.dart';

class ResultContentText extends StatelessWidget {
  const ResultContentText({
    Key key,
    @required this.widget,
    @required this.resultContentString,
    @required this.resultContentDesc,
  }) : super(key: key);

  final ResultPage widget;
  final String resultContentString;
  final String resultContentDesc;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Text(
          '$resultContentDesc: $resultContentString',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}