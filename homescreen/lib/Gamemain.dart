import 'package:flutter/material.dart';
import 'gamehomepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget { // widget cannot change when the user interacts with it, hence stateless 
  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      
    );
  }
}