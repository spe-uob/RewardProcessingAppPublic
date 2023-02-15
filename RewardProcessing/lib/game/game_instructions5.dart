import 'package:flutter/material.dart';
import 'game_instructions.dart';
import 'package:flutter/services.dart';

class GameInstructions5 extends StatefulWidget {
  const GameInstructions5({super.key});

  @override
  State<GameInstructions5> createState() => _GameInstructions5State();
}

class _GameInstructions5State extends State<GameInstructions5> {
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
                        Image.asset('assets/images/gi5.png',
                          scale: 11,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  // MaterialPageRoute(builder: (context) => const Questionnaire())
                                  MaterialPageRoute(builder: (context) => const GameInstructions())
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
