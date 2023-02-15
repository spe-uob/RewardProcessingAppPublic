import 'package:flutter/material.dart';

class MyPath extends StatelessWidget{

  final innerColor;
  final outerColor;
  final child;

  MyPath({this.innerColor, this.outerColor,this.child});
  @override
  Widget build(BuildContext context){
    return Padding(
        padding: const EdgeInsets.all(1.0),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Container(
                padding:EdgeInsets.all(4) ,
                color: outerColor,// this will be set to whichever color we choose in game_homepage.dart
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                        color: innerColor,// this will be set to whichever color we choose in game_homepage.dart
                        child: Center( child:child))// container for innerColor
                )
            )// container for outerColor
        ));
  }
}