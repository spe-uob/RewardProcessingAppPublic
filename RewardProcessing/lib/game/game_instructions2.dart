import 'package:flutter/material.dart';
import 'package:rewardprocessing/game/game_instructions3.dart';
import 'package:flutter/services.dart';

class GameInstructions2 extends StatefulWidget {
  final String id;
  const GameInstructions2({super.key, required this.id});

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
          backgroundColor: const Color(0xff000000),
          body: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GameInstructions3(id: widget.id)),
              );
            },
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/gi2.png',
                    scale: 2.7,
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}
