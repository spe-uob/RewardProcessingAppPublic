import 'package:flutter/material.dart';
import 'package:homescreen/complete.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter/services.dart';

class GameInstructions extends StatefulWidget {
  const GameInstructions({super.key});

  @override
  State<GameInstructions> createState() => _GameInstructionsState();
}

class _GameInstructionsState extends State<GameInstructions> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: ()async {
          return false; // disable back page
        },
        child: Scaffold(
            body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            margin: const EdgeInsets.only(right: 220),
                            child: const Text('Score: 0',
                                style: TextStyle(fontSize: 15,
                                    letterSpacing: 0.5)
                            )
                        ),
                        Container(
                            margin: const EdgeInsets.only(left: 220),
                            child: const Text('Target Goal: 200 Points',
                                style: TextStyle(fontSize: 15,
                                    letterSpacing: 0.5)
                            )
                        )
                      ]
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 100, right:100, bottom: 20),
                      child: LinearPercentIndicator(
                          lineHeight: 10,
                          animationDuration: 300,
                          percent: 0,
                          barRadius: const Radius.circular(30),
                          backgroundColor: const Color(0xFFDCDCDC),
                          progressColor: const Color(0xFF32BEC4)
                      )
                  ),
                  SizedBox(
                      child: Container(
                          margin: const EdgeInsets.only(left:30, right: 30, bottom: 50),
                          width: 380,
                          height: 200,
                          decoration: const BoxDecoration(
                              color: Color(0xFFFFD9A0),
                              borderRadius: BorderRadius.all(Radius.circular(30))
                          ),
                          alignment: Alignment.center,
                          child: Container (
                              margin: const EdgeInsets.only(left: 10, right: 10),
                              child: const Text (
                                'Game, no map yet',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 17,
                                      height: 1.45
                                  )
                              )
                          )
                      )
                  )
                ]
            ),
            bottomSheet: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                // MaterialPageRoute(builder: (context) => const Questionnaire())
                                MaterialPageRoute(builder: (context) => const Complete())
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(100, 20),
                            backgroundColor: const Color(0xFF00A8AF),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100)),
                            elevation: 2.0,),
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
