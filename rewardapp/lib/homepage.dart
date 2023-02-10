import 'dart:async';
import 'dart:html';
import 'dart:math';

import 'package:flutter/material.dart';
//import 'package:pacman/pacman.dart';

//import 'barriers.dart';
//import 'ghost.dart';
//import 'pixel.dart'

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override 
  Widget build(BuildContext context) {
    var colors;
    var SilverGrid;
    return Scaffold(
       backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Container(
            child:GridView.builder(gridDelegate: SilverGrid, itemBuilder: null)
            ),
            ),
            Expanded(
              child: Container(
              color: colors.pink,
              ),
              ),

        ],
    )
    );
    
  }
}