import 'dart:async';

import 'package:flutter/material.dart';
import 'pixel.dart';
import 'path.dart';
import 'player.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static int numberInRow = 11;
  int numberOfSquares = numberInRow * 17;
  int player = numberInRow = 15 + 1;

  //the walls of the map
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
    9,
    10,
    11,
    22,
    33,
    44,
    55,
    66,
    77,
    99,
    110,
    121,
    132,
    143,
    154,
    165,
    166,
    167,
    168,
    169,
    170,
    171,
    172,
    173,
    174,
    175,
    164,
    153,
    142,
    131,
    120,
    109,
    87,
    76,
    65,
    54,
    43,
    32,
    21,
    78,
    79,
    80,
    100,
    101,
    102,
    84,
    85,
    86,
    106,
    107,
    108,
    24,
    35,
    46,
    57,
    30,
    41,
    52,
    63,
    81,
    70,
    59,
    61,
    72,
    83,
    26,
    28,
    37,
    38,
    39,
    123,
    134,
    145,
    129,
    140,
    151,
    103,
    114,
    125,
    105,
    116,
    127,
    147,
    148,
    149,
  ];

  String direction = 'right';// direction changes when we swipe

  void startGame() {
    Timer.periodic(Duration(milliseconds: 150),(timer){
     if(!barriers.contains(player+1)){
       setState(() {
         player++;
       });
     }//the if statement returns false if the (players position)+1 is equal to any
      //the barriers indices, thus preventing it from moving further
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Expanded(
              flex: 5,
              child: GestureDetector(
                onVerticalDragUpdate: (details){
                  if(details.delta.dy>0){
                    direction="up";
                  }else if(details.delta.dy<0){
                    direction="down";
                  }
                  print(direction);
                },
                child: Container(
                  child: GridView.builder(
                      physics:
                          NeverScrollableScrollPhysics(), // prevent the page from scrolling
                      itemCount: numberOfSquares,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: numberInRow),
                      itemBuilder: (BuildContext context, int index) {
                        if (player == index) {
                          return MyPlayer();
                        } else if (barriers.contains(index)) {
                          // setting boundary gridboxes to a different color
                          return MyPixel(
                            innerColor: Colors.blue[800],
                            outerColor: Colors.blue[900],
                            //child: Text(index.toString())// hiding the index of the pixels
                          );
                        } else {
                          return MyPath(
                            innerColor: Colors.yellow,
                            outerColor: Colors.black,
                            //child: Text(index.toString())// hiding the index of the pixels
                          );
                        }
                      }),
                ),
              ),
            ),
            Expanded(
                child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:  [
                  Text("Score:",
                      style: TextStyle(color: Colors.white, fontSize: 40)),
                  GestureDetector(
                    onTap:startGame,
                    child: Text(" P L A Y",style: TextStyle(color: Colors.white, fontSize: 40),),
                  )
                ],
              ),
            ))
          ],
        ));
  }


}
