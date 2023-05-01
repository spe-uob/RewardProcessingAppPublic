import 'package:flutter/material.dart';
import 'package:rewardprocessing/game/game_instructions4.dart';
import 'package:flutter/services.dart';

class GameInstructions3 extends StatefulWidget {
  final String id;
  const GameInstructions3({super.key, required this.id});

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
    return Scaffold(
      backgroundColor: const Color(0xff000000),
      body: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => GameInstructions4(id: widget.id)),
          );
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/gi3.png',
                scale: 2.9,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
