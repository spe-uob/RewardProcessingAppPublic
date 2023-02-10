import 'package:flutter/material.dart';
import 'package:rewardprocessing/game/game_instructions2.dart';
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
          backgroundColor: const Color(0xFFFFFFFF),
            body: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('assets/images/gi1.png',
                        scale: 11,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                // MaterialPageRoute(builder: (context) => const Questionnaire())
                                MaterialPageRoute(builder: (context) => const GameInstructions2())
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
              ],
            )
        )
    );
  }
}
