import 'package:flutter/material.dart';
import 'package:rewardprocessing/game/game_instructions5.dart';
import 'package:flutter/services.dart';

class GameInstructions4 extends StatefulWidget {
  final String id;
  const GameInstructions4({super.key, required this.id});

  @override
  State<GameInstructions4> createState() => _GameInstructions4State();
}

class _GameInstructions4State extends State<GameInstructions4> {
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
        onWillPop: () async {
          return false; // disable back page
        },
        child: Scaffold(
          backgroundColor: const Color(0xff000000),
          body: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GameInstructions5(id: widget.id)),
              );
            },
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/gi4.png',
                    scale: 2.9,
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}
