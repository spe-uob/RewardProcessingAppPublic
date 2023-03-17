import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class GameMap extends StatefulWidget {
  const GameMap({super.key});

  @override
  State<GameMap> createState() => _GameMapState();
}

int row = 6;
int col = row * 11;
int player = 49;
int score = 0;
double percentage = 0;
 String imagePath = "assets/images/guess.png";
   String leftImage = "assets/images/guess.png";
  String rightImage = "assets/images/guess.png";


class _GameMapState extends State<GameMap> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

    List<int> leftGuess = [13, 23, 25];
  List<int> rightGuess = [19, 29, 31];

  List<int> guess = [13, 19, 23, 25, 29, 31];
  double topHeight = 60;
  int quarterTurns = 0;
  List<int> pellets = [24, 35, 46, 47, 48, 50, 51, 52, 30, 41, 30];
  List<int> paths = [24, 35, 46, 47, 48, 49, 50, 51, 52, 30, 41, 30];
  String leftImage13 = "assets/images/guess.png";
  String leftImage23 = "assets/images/guess.png";

  String leftImage25 = "assets/images/guess.png";

  String rightImage19 = "assets/images/guess.png";
  String rightImage29 = "assets/images/guess.png";
  String rightImage31 = "assets/images/guess.png";

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
    15,
    17,
    21,
    22,
    27,
    32,
    33,
    34,
    36,
    37,
    39,
    40,
    42,
    43,
    44,
    45,
    53,
    54,
    55,
    56,
    57,
    58,
    59,
    60,
    61,
    62,
    63,
    64,
    65
     ];




  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  void trigger() {
    if (pellets.contains(player)) {
      pellets.remove(player);
      score = score + 5;
      percentage = score / 2;
    }
  }

  void refresh() {}

  void clickGuess() {}

  void movePlayer(int right, int down) {
    int nowPlayer = player + down * 11 + right;
    
    if (down == 0) {
      int c = player % 11 - nowPlayer % 11;
      if (c != -1 && c != 1) {
        nowPlayer = player;
      }
    }
    if (right == 0) {
      int c = player ~/ 11 - nowPlayer ~/ 11;
      if (c != -1 && c != 1) {
        nowPlayer = player;
      }
    }
   
    if (right == -1 && down == 0) {
      quarterTurns = -2;
    }
    if (right == 1 && down == 0) {
      quarterTurns = 0;
    }
    if (right == 0 && down == -1) {
      quarterTurns = -1;
    }
    if (right == 0 && down == 1) {
      quarterTurns = 1;
    }

    if (paths.contains(nowPlayer)) {
      setState(() {
        player = nowPlayer;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];
    for (int i = 0; i < 6; i++) {
      for (int j = 0; j < 11; j++) {
        items.add(getWiget(i * 11 + j));
      }
    }

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    return Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.transparent,
        ),
        body: Column(children: [
          Container(
              height: topHeight - 10,
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: LinearPercentIndicator(
                      width: 400.0,
                      lineHeight: 16,
                      progressColor: Colors.teal[400],
                      backgroundColor: Colors.grey[400],
                      center: Text("$percentage%"),
                      leading: Text(
                        "Score:$score",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                            color: Colors.black),
                      ),
                      percent: percentage / 100,
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    "Target Goal: 200points",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        color: Colors.black),
                  ),
                ],
              )),
          Container(
            height: 10,
            color: const Color(0xffeeeeee),
          ),
          Expanded(
            child: Container(
                color: Colors.black,
                child: Stack(
                  children: items,
                )),
          )
        ]));
  }

  Widget getWiget(int index) {
    double itemWidth = (MediaQuery.of(context).size.height - topHeight) / row;
    if (itemWidth > (MediaQuery.of(context).size.width / 11)) {
      itemWidth = MediaQuery.of(context).size.width / 11;
    }
    Widget w;

    double startLeft = (MediaQuery.of(context).size.width - itemWidth * 11) / 2;
    double startTop =
        ((MediaQuery.of(context).size.height - topHeight) - itemWidth * 6) / 2;
    if (26 == index) {
      w = GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            movePlayer(-1, 0);
            trigger();
          },
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child:
                Column(children: [Image.asset("assets/images/LeftClick.png")]),
          ));
    } else if (28 == index) {
      w = GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            movePlayer(1, 0);
            trigger();
          },
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child:
                Column(children: [Image.asset("assets/images/RightClick.png")]),
          ));
    } else if (16 == index) {
      w = GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            movePlayer(0, -1);
            trigger();
          },
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: Column(children: [Image.asset("assets/images/UpClick.png")]),
          ));
    } else if (38 == index) {
      w = GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            movePlayer(0, 1);
            trigger();
          },
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child:
                Column(children: [Image.asset("assets/images/DownClick.png")]),
          ));
    } else if (player == index) {
      w = RotatedBox(
          quarterTurns: quarterTurns == -2 ? 0 : quarterTurns,
          child: Container(
            color: Colors.black,
            padding: const EdgeInsets.all(1.0),
            child: Column(children: [
              Image.asset(
                quarterTurns == -2
                    ? "assets/images/pacmanleft.png"
                    : "assets/images/pacman.png",
                width: itemWidth - 2,
                height: itemWidth - 2,
              )
            ]),
          ));
    } 





    else if (13 == index) {
      w = GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            var doubleValue = Random().nextDouble();

            if (player == 24) {
              
              if (leftImage13 == "assets/images/guess.png") {
                if (doubleValue < 0.5) {
                  setState(() {
                    leftImage13 = "assets/images/cherry.png";
                  });
                } else {
                  setState(() {
                    leftImage13 = "assets/images/ghost.png";
                  });
                }
              } else if (leftImage13 == "assets/images/cherry.png") {
                setState(() {
                  leftImage13 = "assets/images/NoCherry.png";
                  score = score + 5;
                });
              } else if (leftImage13 == "assets/images/.ghost.png") {}
            }
          },

          child: Padding(
            padding: const EdgeInsets.all(0.1),
            child: Column(children: [Image.asset(leftImage13)]),
          ));
    } else if (23 == index) {
      w = GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            var doubleValue = Random().nextDouble();

            if (player == 24) {
              
              if (leftImage23 == "assets/images/guess.png") {
                if (doubleValue < 0.5) {
                  setState(() {
                    leftImage23 = "assets/images/cherry.png";
                  });
                } else {
                  setState(() {
                    leftImage23 = "assets/images/ghost.png";
                  });
                }
              } else if (leftImage23 == "assets/images/cherry.png") {
                setState(() {
                  leftImage23 = "assets/images/NoCherry.png";
                  score = score + 5;
                });
              } else if (leftImage23 == "assets/images/.ghost.png") {}
            }
          },

          child: Padding(
            padding: const EdgeInsets.all(0.1),
            child: Column(children: [Image.asset(leftImage23)]),
          ));
    } else if (25 == index) {
      w = GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            var doubleValue = Random().nextDouble();

            if (player == 24) {
              
              if (leftImage25 == "assets/images/guess.png") {
                if (doubleValue < 0.5) {
                  setState(() {
                    leftImage25 = "assets/images/cherry.png";
                  });
                } else {
                  setState(() {
                    leftImage25 = "assets/images/ghost.png";
                  });
                }
              } else if (leftImage25 == "assets/images/cherry.png") {
                setState(() {
                  leftImage25 = "assets/images/NoCherry.png";
                  score = score + 5;
                });
              } else if (leftImage25 == "assets/images/.ghost.png") {}
            }
          },

          child: Padding(
            padding: const EdgeInsets.all(0.1),
            child: Column(children: [Image.asset(leftImage25)]),
          ));
    } else if (19 == index) {
      w = GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            var doubleValue = Random().nextDouble();

            if (player == 30) {

              if (rightImage19 == "assets/images/guess.png") {
                if (doubleValue < 0.5) {
                  setState(() {
                    rightImage19 = "assets/images/cherry.png";
                  });
                } else {
                  setState(() {
                    rightImage19 = "assets/images/ghost.png";
                  });
                }
              } else if (rightImage19 == "assets/images/cherry.png") {
                setState(() {
                  rightImage19 = "assets/images/NoCherry.png";
                  score = score + 5;
                });
              } else if (rightImage19 == "assets/images/.ghost.png") {}
            }
          },
          
          child: Padding(
            padding: const EdgeInsets.all(0.1),
            child: Column(children: [Image.asset(rightImage19)]),
          ));
    } else if (29 == index) {
      w = GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            var doubleValue = Random().nextDouble();

            if (player == 30) {
              if (rightImage29 == "assets/images/guess.png") {
                if (doubleValue < 0.5) {
                  setState(() {
                    rightImage29  = "assets/images/cherry.png";
                  });
                } else {
                  setState(() {
                    rightImage29  = "assets/images/ghost.png";
                  });
                }
              } else if (rightImage29  == "assets/images/cherry.png") {
                setState(() {
                  rightImage29  = "assets/images/NoCherry.png";
                  score = score + 5;
                });
              } else if (rightImage29  == "assets/images/.ghost.png") {}
            }
          },
          
          child: Padding(
            padding: const EdgeInsets.all(0.1),
            child: Column(children: [Image.asset(rightImage29 )]),
          ));
    } else if (31 == index) {
      w = GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            var doubleValue = Random().nextDouble();

            if (player == 30) {





              if (rightImage31 == "assets/images/guess.png") {
                if (doubleValue < 0.5) {
                  setState(() {
                    rightImage31  = "assets/images/cherry.png";
                  });
                } else {
                  setState(() {
                    rightImage31  = "assets/images/ghost.png";
                  });
                }
              } else if (rightImage31  == "assets/images/cherry.png") {
                setState(() {
                  rightImage31  = "assets/images/NoCherry.png";
                  score = score + 5;
                });
              } else if (rightImage31  == "assets/images/.ghost.png") {}
            }
          },
          
          child: Padding(
            padding: const EdgeInsets.all(0.1),
            child: Column(children: [Image.asset(rightImage31 )]),
          ));
    } 

    





    
    
    else if (pellets.contains(index)) {
      w = Padding(
        padding: const EdgeInsets.all(1.0),
        child: Column(children: [Image.asset("assets/images/dot.png")]),
      );
    } else if (barriers.contains(index)) {
      w = Padding(
        padding: const EdgeInsets.all(1.0),
        child: Column(children: [Image.asset("assets/images/wall.png")]),
      );
    } else {
      w = Padding(
        padding: const EdgeInsets.all(1.0),
        child: Container(
          color: Colors.black,
        ),
      );
    }




    debugPrint("index$index");
    debugPrint("left${(index % 11) * itemWidth + startLeft}");
    debugPrint("top${index ~/ 11 * itemWidth + startTop}");
    return Positioned(
        left: ((index % 11) * itemWidth).toInt() + startLeft,
        top: (index ~/ 11 * itemWidth).toInt() + startTop,
        width: itemWidth,
        height: itemWidth,
        child: w);
  }
}
