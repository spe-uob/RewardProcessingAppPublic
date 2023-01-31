import 'package:flutter/material.dart';

class GameInstructions extends StatefulWidget {
  const GameInstructions({super.key});

  @override
  State<GameInstructions> createState() => _GameInstructionsState();
}

class _GameInstructionsState extends State<GameInstructions> {

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: ()async {
          return false; // disable back page
        },
        child: Scaffold(
            body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      margin: const EdgeInsets.all(90),
                      child: const Text('Game Instructions',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 24,
                              color: Colors.black
                          )
                      )
                  )
                ]
            )
        )
    );
  }
}
