import 'package:flutter/material.dart';

class questionnaire extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          alignment: Alignment.center,
            margin: const EdgeInsets.only(right: 30, left: 30),
            child: const Text(
              'Using the bar below, rate how you feel right now:',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
        )
    );
  }

}