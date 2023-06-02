import 'package:flutter/material.dart';
import 'package:rewardprocessing/game/game_instructions3.dart';
import 'package:flutter/services.dart';

class GameInstructions2 extends StatefulWidget {
  final String id;
  final String day;
  const GameInstructions2({super.key, required this.id, required this.day});

  @override
  State<GameInstructions2> createState() => _GameInstructions2State();
}

class _GameInstructions2State extends State<GameInstructions2> {
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
                      Image.asset('assets/images/gi2.png',
                        scale: 3.75,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => GameInstructions3(id: widget.id, day: widget.day)
                                )
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(110, 25),
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
                    ]
                )
              ],
            )
        )
    );
  }
}