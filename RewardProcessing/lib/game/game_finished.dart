import 'package:flutter/material.dart';
import 'package:rewardprocessing/questionnaire/finishedquestion.dart';

class GameFinished extends StatefulWidget {
  const GameFinished({super.key});

  @override
  State<GameFinished> createState() => _GameFinishedState();
}

class _GameFinishedState extends State<GameFinished> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return false; // disable back page
        },
        child: Scaffold(
            backgroundColor: const Color(0xFFFFFFFF),
            body: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const FinishedQuestion()));
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(100, 20),
                            backgroundColor: const Color(0xFF00A8AF),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100)),
                            elevation: 2.0,
                          ),
                          child: const Text('Click Here To Finish',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300)))
                    ])
              ],
            )));
  }
}
