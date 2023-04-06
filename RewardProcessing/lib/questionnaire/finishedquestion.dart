import 'package:flutter/material.dart';
import 'package:rewardprocessing/questionnaire/finishedquestion2.dart';
import 'package:flutter/services.dart';

class FinishedQuestion extends StatefulWidget {
  final String id;
  const FinishedQuestion({super.key, required this.id});

  @override
  State<FinishedQuestion> createState() => _FinishedQuestionState();
}

class _FinishedQuestionState extends State<FinishedQuestion> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return false; // disable back page
        },
        child: Scaffold(
            body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset('assets/images/UoB_logo2.png',
                    width: 300,
                  ),
                  Container(
                    margin: const EdgeInsets.only(right:30, left:30, top:55, bottom:20),
                    child: const Text('CONGRATULATIONS',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.black
                        ),
                  ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(right: 30, left: 30, top: 52, bottom: 20),
                      child: const Text('You finished the game!',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20,
                              color: Colors.black
                          )
                      )
                  ),
                  Container(
                      margin: const EdgeInsets.only(right :30, left: 30, top: 30, bottom: 30),
                      child: const Text("Please answer two final questions to complete today's study: ",
                          overflow: TextOverflow.visible,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black
                          )
                      )
                  ),
                  Container(
                      margin: const EdgeInsets.only(left: 10, right: 10, top: 30),
                      child: ElevatedButton(
                          onPressed: () async {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => FinishedQuestion2 (
                                    id: widget.id
                                )
                                )
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(160, 60),
                            backgroundColor: const Color(0xFF00A8AF),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100)
                            ),
                            elevation: 2.0
                          ),
                          child: const Text(
                              'Continue',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w300
                              )
                          )
                      )
                  )
                ]
            )
        )
    );
  }
}
