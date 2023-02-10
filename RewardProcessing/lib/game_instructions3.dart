import 'package:flutter/material.dart';
import 'package:homescreen/game_instructions4.dart';
import 'package:flutter/services.dart';

class GameInstructions3 extends StatefulWidget {
  const GameInstructions3({super.key});

  @override
  State<GameInstructions3> createState() => _GameInstructions3State();
}

class _GameInstructions3State extends State<GameInstructions3> {
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
            backgroundColor: const Color(0xFFFFFFFF),
            body: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('assets/images/gi3.png',
                          scale: 11,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  // MaterialPageRoute(builder: (context) => const Questionnaire())
                                  MaterialPageRoute(builder: (context) => const GameInstructions4())
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
                      ]
                  )
                ]
            )
        )
    );
  }
}
