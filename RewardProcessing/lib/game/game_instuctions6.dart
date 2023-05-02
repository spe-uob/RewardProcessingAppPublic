import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rewardprocessing/game/aim.dart';

class GameInstructions6 extends StatefulWidget {
  final String id;
  const GameInstructions6({super.key, required this.id});

  @override
  State<GameInstructions6> createState() => _GameInstructions6State();
}

class _GameInstructions5State extends State<GameInstructions6> {
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
            MaterialPageRoute(builder: (context) => Aim(id: widget.id)),
          );
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/gi6.png',
                scale: 2.9,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
