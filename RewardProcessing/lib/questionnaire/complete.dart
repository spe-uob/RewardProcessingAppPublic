import 'package:flutter/material.dart';
import 'package:rewardprocessing/game/game_instructions.dart';
import 'package:flutter/services.dart';


class Complete extends StatefulWidget {
  final String id;
  final String day;
  const Complete({super.key, required this.id, required this.day});

  @override
  State<Complete> createState() => _CompleteState();
}

class _CompleteState extends State<Complete> {
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
                      margin: const EdgeInsets.only(right: 50, left: 50, top: 50, bottom: 20),
                      child: const Text('Thank you for completing the questionnaire!',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                          )
                      )
                  ),
                  Container(
                      margin: const EdgeInsets.only(right :50, left: 50, top: 20, bottom: 30),
                      child: const Text('You will receive instructions on how to play the game part of the study.',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 17,
                              color: Colors.black
                          )
                      )
                  ),
                  Container(
                      margin: const EdgeInsets.only(left: 10, right: 10, top: 30),
                      child:
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => GameInstructions(id: widget.id, day: widget.day)
                                )
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(170, 70),
                            backgroundColor: const Color(0xFF00A8AF),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100)
                            ),
                            elevation: 2.0,),
                          child: const Text(
                              'Game Instructions',
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