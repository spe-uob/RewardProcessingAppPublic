import 'package:flutter/material.dart';
import 'package:rewardprocessing/questionnaire/finishedquestion2.dart';

class FinishedQuestion extends StatefulWidget {
  const FinishedQuestion({super.key});

  @override
  State<FinishedQuestion> createState() => _FinishedQuestionState();
}

class _FinishedQuestionState extends State<FinishedQuestion> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return false; // disable back page
        },
        child: Scaffold(
            body: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/UoB_logo2.png',
                  scale: 8,
                ),
                const Text('\nCONGRATULATIONS!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    )),
                Container(
                    margin: const EdgeInsets.only(
                        right: 50, left: 50, top: 20, bottom: 10),
                    child: RichText(
                        text: const TextSpan(
                            style: TextStyle(
                                color: Colors.blue), //apply style to all
                            children: [
                          TextSpan(
                              text: 'You finished the game!',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              )),
                        ]))),
                Container(
                    margin: const EdgeInsets.only(
                        right: 50, left: 50, top: 10, bottom: 10),
                    child: RichText(
                        text: const TextSpan(
                            style: TextStyle(
                                color: Colors.blue), //apply style to all
                            children: [
                          TextSpan(
                              text: 'Please answer ',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              )),
                          TextSpan(
                              text: ' two final questions\n',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              )),
                          TextSpan(
                              text: 'to complete today\'s study:',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              )),
                        ]))),
                Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const FinishedQuestion2(
                                        id: '',
                                      )));
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(120, 50),
                          backgroundColor: const Color(0xFF00A8AF),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100)),
                          elevation: 2.0,
                        ),
                        child: const Text('Continue',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w300))))
              ])
        ])));
  }
}
