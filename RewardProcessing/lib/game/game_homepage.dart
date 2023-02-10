import 'package:flutter/material.dart';
import 'package:rewardprocessing/game/game_main.dart';

class MyApp extends StatelessWidget { // widget cannot change when the user interacts with it, hence stateless 
  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // to remove the defalut banner
      home: HomePage(),

    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

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


}
