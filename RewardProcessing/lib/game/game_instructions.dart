import 'package:flutter/material.dart';
import 'package:rewardprocessing/game/game_instructions2.dart';
import 'package:flutter/services.dart';

class GameInstructions extends StatefulWidget {
  final String id;
  const GameInstructions({super.key, required this.id});

  @override
  State<GameInstructions> createState() => _GameInstructionsState();
}

class _GameInstructionsState extends State<GameInstructions> {
  bool _showText = true;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _showText = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return false; // disable back page
        },
        child: Scaffold(
          backgroundColor: const Color(0xff000000),
          body: Stack(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GameInstructions2(id: widget.id)),
                  );
                },
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/gi1.png',
                        scale: 2.9,
                      ),
                    ],
                  ),
                ),
              ),
              if (_showText)
                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.4),
                    ),
                    child: const Center(
                      child:Text(
                        'Click anywhere to continue',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        )
    );
  }
}