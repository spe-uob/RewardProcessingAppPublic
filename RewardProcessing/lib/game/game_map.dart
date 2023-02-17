import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GameMap extends StatefulWidget {
  const GameMap({super.key});

  @override
  State<GameMap> createState() => _GameMapState();
}

int row = 6;
int col = row * 11;
int player = row * 5 + 1;

class _GameMapState extends State<GameMap> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }

  List<int> guess = [9, 16, 21, 57, 52, 45];

  List<int> pellets = [13, 14, 15, 19, 25, 37, 43, 49, 50, 51];

  List<int> barriers = [
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    11,
    12,
    18,
    24,
    30,
    36,
    42,
    48,
    54,
    60,
    17,
    23,
    29,
    35,
    41,
    47,
    53,
    59,
    65,
    61,
    62,
    63,
    64,
    55,
    56,
    20,
    26,
    38,
    44,
    33,
    28,
    40,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(children: [
        Expanded(
          flex: 11,
          // child: Container(
          child: GridView.builder(
              itemCount: col,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: row),
              itemBuilder: (buildContext, int index) {
                if (32 == index) {
                  return Padding(
                  padding: const EdgeInsets.all(1.0),
                  
                    child: Column(children: [
                      Image.asset("assets/images/LeftClick.png")
                      ])
                  ,
                );
                } else if (34 == index) {
                   return Padding(
                  padding: const EdgeInsets.all(1.0),
                 
                    child: Column(children: [
                      Image.asset("assets/images/RightClick.png")
                      ])
                  ,
                );
                  
                } else if (27 == index) {
                   return Padding(
                  padding: const EdgeInsets.all(1.0),
                  
                    child: Column(children: [
                      Image.asset("assets/images/UpClick.png")
                      ])
                  ,
                );
                
                } else if (39 == index) {
                   return Padding(
                  padding: const EdgeInsets.all(1.0),
                
                    child: Column(children: [
                     Image.asset("assets/images/DownClick.png")
                      ])
                  ,
                );
                } else if (player == index) {
                   return Padding(
                  padding: const EdgeInsets.all(1.0),
                
                    child: Column(children: [
                      Image.asset("assets/images/pacman01.pic.jpg")
                      ])
                  ,
                );
                } else if (barriers.contains(index)) {
                   return Padding(
                  padding: const EdgeInsets.all(1.0),
                 
                    child: Column(children: [
                      Image.asset("assets/images/wall.png")
                      ])
                  ,
                );
                } else if (guess.contains(index)) {
                   return Padding(
                  padding: const EdgeInsets.all(1.0),
                  
                    child: Column(children: [
                     Image.asset("assets/images/thisguess.png")
                      ])
                  ,
                );
                } else if (pellets.contains(index)) {
                   return Padding(
                  padding: const EdgeInsets.all(1.0),
                
                    child: Column(children: [
                     Image.asset("assets/images/dot.png")
                      ])
                  ,
                );
                } else {}
                return Padding(
                    padding: const EdgeInsets.all(1.0),
                      child: Container(
                        // child: Text(index.toString()),
                        color: Colors.black,
                      ),
                    );
              }),
        ),
        Expanded(
            child: Column(
          children: const [
            Text("Score:",
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.black, fontSize: 30)),
            Text("Target Goal: 200 points",
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.black, fontSize: 30))
          ],
        ))
      ]),
    );
  }
}
