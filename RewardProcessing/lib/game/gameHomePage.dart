import 'dart:ffi';

import 'package:flutter/material.dart';
import 'Gamemain.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // using scaffold widget as the main parent of the page
    int numberInRow=11;
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Column(children: [
        Expanded(
          flex: 5,
          child: Container(
            ),
          ),
        Expanded(
          child: Container(color: Colors.pink),
        )
      ]),
    );
  }

  Null get newMethod => null;
}
