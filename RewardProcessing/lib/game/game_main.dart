import 'package:flutter/material.dart';
import 'package:rewardprocessing/game/game_homepage.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget { // widget cannot change when the user interacts with it, hence stateless 
  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // to remove the defalut banner
      home: HomePage(),
      
    );
  }
}
