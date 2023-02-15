import 'package:flutter/material.dart';

class MyPixel extends StatelessWidget{

  final color;
  final child;

  MyPixel({this.color, this.child});
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        color: color,// this will be set to whichever color we choose in game_homepage.dart
        child: Center( child:child)));
  }
}