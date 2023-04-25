import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:rewardprocessing/game/game_finished2.dart';

class GameMap2 extends StatefulWidget {
  final String id;
  const GameMap2({super.key, required this.id});

  @override
  State<GameMap2> createState() => _GameMap2State();
}

int row = 8;
int col = row * 15;
int player = 65;
int score = 0;
double percentage = 0;

String imagePath = "assets/images/guess.png";
String leftImage = "assets/images/guess.png";
String rightImage = "assets/images/guess.png";

class _GameMap2State extends State<GameMap2> {
  late Timer _timer;
  int _seconds = 0;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _seconds++;
      });

      if (_seconds > 300) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => GameFinished2(id: widget.id)),
        );
        _timer.cancel(); //stop timer
      }
    });
  }

  List<int> leftGuess = [17, 31, 33];
  List<int> rightGuess = [23, 37, 39];

  int fresh = 0;

  List<int> guess = [17, 31, 33, 23, 37, 39];
  double topHeight = 60;
  int quarterTurns = 0;

  String leftImage17 = "assets/images/guess.png";
  String leftImage31 = "assets/images/guess.png";

  String leftImage33 = "assets/images/guess.png";

  String rightImage23 = "assets/images/guess.png";
  String rightImage37 = "assets/images/guess.png";
  String rightImage39 = "assets/images/guess.png";

  List<int> paths = [
    32,
    47,
    62,
    61,
    76,
    91,
    92,
    93,
    94,
    79,
    64,
    66,
    81,
    96,
    97,
    98,
    99,
    84,
    69,
    68,
    53,
    38,
    65
  ];
  List<int> pellets = [
    32,
    47,
    62,
    61,
    76,
    91,
    92,
    93,
    94,
    79,
    64,
    66,
    81,
    96,
    97,
    98,
    99,
    84,
    69,
    68,
    53,
    38
  ];

  List<int> blocks = [58, 73, 88];

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
    15,
    30,
    45,
    60,
    75,
    90,
    105,
    106,
    107,
    108,
    109,
    110,
    111,
    112,
    113,
    114,
    115,
    100,
    85,
    70,
    55,
    40,
    25,
    46,
    77,
    78,
    63,
    48,
    49,
    19,
    35,
    21,
    51,
    52,
    67,
    82,
    83,
    54,
    80,
    95,
    20,
    34,
    36,
    50,

    // 58,
    // 73,
    // 88
  ];
  int guessIndex = -1;
  List guessesLeft = [17, 31, 33];
  List guessesRight = [23, 37, 39];

  Map clickCells = {
    "17": "assets/images/guess.png",
    "31": "assets/images/guess.png",
    "33": "assets/images/guess.png",
    "23": "assets/images/guess.png",
    "37": "assets/images/guess.png",
    "39": "assets/images/guess.png",
  };

  bool leftIsEmpty = false;
  bool rightIsEmpty = false;

  bool leftActive = true;
  bool inactiveFirstClicked = false;
  double cherryProbability = 0.8;
  double emptyProbability = 0.2;
  double switchInactiveProbability = 0.3;

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    _timer.cancel;
  }

  void trigger() {
    if (pellets.contains(player)) {
      pellets.remove(player);
      calculate(0);
      refresh();
    }
  }

  void refresh() {
    if (player == 47 || player == 53) {
      if (fresh != 0) {
        leftImage17 = "assets/images/guess.png";
        leftImage31 = "assets/images/guess.png";
        leftImage33 = "assets/images/guess.png";
        rightImage23 = "assets/images/guess.png";
        rightImage37 = "assets/images/guess.png";
        rightImage39 = "assets/images/guess.png";
        fresh = 0;
      }
    }

    setState(() {
      imagePath == "assets/images/guess.png";
    });
    // }
  }

  void calculate(int type) {
    if (score >= 200) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => GameFinished2(id: widget.id)));
    }

    if (type == 0) {
      score = score + 1;
    } else if (type == 1) {
      score = score + 5;
    }

    percentage = score / 2;
  }

  void movePlayer(int right, int down) {
    int nowPlayer = player + down * 15 + right;

    if (down == 0) {
      int c = player % 15 - nowPlayer % 15;
      if (c != -1 && c != 1) {
        nowPlayer = player;
      }
    }
    if (right == 0) {
      int c = player ~/ 15 - nowPlayer ~/ 15;
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

    int lastPlayer = player;

    if (paths.contains(nowPlayer)) {
      setState(() {
        player = nowPlayer;
      });
    }
    if (lastPlayer != player) {
      if (player == 32 || player == 38) {
        if (guessIndex == -1) {
          // randomCanGuess(lastPlayer == player);
          randomCanGuess(true, true);
        }
      } else {
        setState(() {
          allGuess();
        });
      }
    }

    if (player == 65) {
      leftIsEmpty = false;
      rightIsEmpty = false;
    }
    setState(() {});
  }

<<<<<<< Updated upstream
  void randomCanGuess(firstEnter) {
    if (player == 32) {
      if (leftActive) {
        var randomValue = Random().nextDouble();
        if (randomValue < switchInactiveProbability && !firstEnter) {
=======
  void randomCanGuess(bool firstEnter, bool changeDirection) {
    if (player == 32) {
      // left
      if (leftActive) {
        var randomValue = Random().nextDouble();
        if (randomValue < switchInactiveProbability && !firstEnter) {
          //  there are 0.3probablity become inactvie
>>>>>>> Stashed changes
          leftActive = false;
          inactiveFirstClicked = firstEnter ? false : true;
        }
      }
      if (guessIndex == -1) {
        guessIndex = guessesLeft[Random().nextInt(guessesLeft.length)];
<<<<<<< Updated upstream
        if (firstEnter) {
=======
        if (changeDirection) {
>>>>>>> Stashed changes
          if (guessIndex == 17) {
            quarterTurns = -1;
          }
          if (guessIndex == 31) {
            quarterTurns = -2;
          }
          if (guessIndex == 33) {
            quarterTurns = 0;
          }
        }

        clickCells[guessIndex.toString()] = "assets/images/thisguess.png";
      }
    }
    if (player == 38) {
<<<<<<< Updated upstream
      if (!leftActive) {
        var randomValue = Random().nextDouble();
        if (randomValue < switchInactiveProbability && !firstEnter) {
=======
      //right
      if (!leftActive) {
        var randomValue = Random().nextDouble();
        if (randomValue < switchInactiveProbability && !firstEnter) {
          // there are 0.3 probablity become inactive
>>>>>>> Stashed changes
          leftActive = true;
          inactiveFirstClicked = firstEnter ? false : true;
        }
      }
      if (guessIndex == -1) {
        guessIndex = guessesRight[Random().nextInt(guessesRight.length)];
<<<<<<< Updated upstream
        if (firstEnter) {
=======
        if (changeDirection) {
>>>>>>> Stashed changes
          if (guessIndex == 23) {
            quarterTurns = -1;
          }
          if (guessIndex == 37) {
            quarterTurns = -2;
          }
          if (guessIndex == 39) {
            quarterTurns = 0;
          }
        }
        clickCells[guessIndex.toString()] = "assets/images/thisguess.png";
      }
    }
    setState(() {});
    debugPrint("guessIndex=$guessIndex");
  }

  void nextShow() {
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        allGuess();
        guessIndex = -1;
      });
<<<<<<< Updated upstream
      randomCanGuess(false);
=======
      randomCanGuess(false, true);
>>>>>>> Stashed changes
    });
  }

  void allGuess() {
    guessIndex = -1;
    for (var a in clickCells.keys) {
      clickCells[a] = "assets/images/guess.png";
    }
  }

  void allGhost(bool left) {
    if (left) {
      clickCells["17"] = "assets/images/ghost.png";
      clickCells["31"] = "assets/images/ghost.png";
      clickCells["33"] = "assets/images/ghost.png";
    } else {
      clickCells["23"] = "assets/images/ghost.png";
      clickCells["37"] = "assets/images/ghost.png";
      clickCells["39"] = "assets/images/ghost.png";
    }
  }

  void clickCell(int index, bool left) {
    String image = clickCells[index.toString()];
    if (image == "assets/images/guess.png") {
      // guess click return
      return;
    }
    if (guessIndex != -1) {
      guessIndex = -1;
      bool ghost = false;
      var randomValue = Random().nextDouble();
      if (image == "assets/images/thisguess.png") {
        if (left && !leftActive) {
<<<<<<< Updated upstream
          if (!inactiveFirstClicked) {
=======
          // click right
          if (!inactiveFirstClicked) {
            // become inactive
>>>>>>> Stashed changes
            allGhost(left);
            ghost = true;
            // inactiveFirstClicked = true;
          } else {
            image = "assets/images/NoCherry.png";
            clickCells[index.toString()] = image;
            fresh++;
          }
        } else if (!left && leftActive) {
<<<<<<< Updated upstream
          if (!inactiveFirstClicked) {
=======
          // click right
          if (!inactiveFirstClicked) {
            // become inactive, without clicked for first time
>>>>>>> Stashed changes
            allGhost(left);
            ghost = true;
            // inactiveFirstClicked = true;
          } else {
            image = "assets/images/NoCherry.png";
            clickCells[index.toString()] = image;
            fresh++;
          }
        } else {
          if (randomValue < cherryProbability) {
<<<<<<< Updated upstream
=======
            // cherry
>>>>>>> Stashed changes
            image = "assets/images/cherry.png";
            clickCells[index.toString()] = image;
            fresh++;
          } else {
            image = "assets/images/NoCherry.png";
            clickCells[index.toString()] = image;
            fresh++;
          }
        }
      }
      if (image != "assets/images/cherry.png" && !ghost) {
        nextShow();
      }
    } else if (image == "assets/images/cherry.png") {
      image = "assets/images/NoCherry.png";
      clickCells[index.toString()] = image;

      fresh++;
      calculate(1);
      nextShow();
      allGuess();
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];
    for (int i = 0; i < 8; i++) {
      for (int j = 0; j < 15; j++) {
        items.add(getWidget(i * 15 + j));
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
                      width: 500.0,
                      lineHeight: 16,
                      progressColor: Colors.teal[400],
                      backgroundColor: Colors.grey[400],
                      center: Text("$percentage%"),
                      leading: Text(
                        "Score:$score",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                            color: Color(0xFF000000)),
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
            ),
          ))
        ]));
  }

  Widget getWidget(int index) {
    double itemWidth = (MediaQuery.of(context).size.height - topHeight) / row;
    if (itemWidth > (MediaQuery.of(context).size.width / 15)) {
      itemWidth = MediaQuery.of(context).size.width / 15;
    }
    Widget w;

    double startLeft = (MediaQuery.of(context).size.width - itemWidth * 15) / 2;
    double startTop =
        ((MediaQuery.of(context).size.height - topHeight) - itemWidth * 8) / 2;
    if (72 == index) {
      w = GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            movePlayer(-1, 0);
            trigger();
            refresh();
          },
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child:
                Column(children: [Image.asset("assets/images/arrowleft.png")]),
          ));
    } else if (74 == index) {
      w = GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            movePlayer(1, 0);
            trigger();
            refresh();
          },
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child:
                Column(children: [Image.asset("assets/images/arrowright.png")]),
          ));
    } else if (43 == index) {
      w = GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            movePlayer(0, -1);
            trigger();
            refresh();
          },
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: Column(children: [Image.asset("assets/images/arrowup.png")]),
          ));
    } else if (103 == index) {
      w = GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            movePlayer(0, 1);
            trigger();
            refresh();
          },
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child:
                Column(children: [Image.asset("assets/images/arrowdown.png")]),
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
    } else if (17 == index) {
      w = GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            clickCell(17, true);
          },
          child: Padding(
            padding: const EdgeInsets.all(0.1),
            child:
                Column(children: [Image.asset(clickCells[index.toString()])]),
          ));
    } else if (31 == index) {
      w = GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            clickCell(31, true);
          },
          child: Padding(
            padding: const EdgeInsets.all(0.1),
            child:
                Column(children: [Image.asset(clickCells[index.toString()])]),
          ));
    } else if (33 == index) {
      w = GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            clickCell(33, true);
          },
          child: Padding(
            padding: const EdgeInsets.all(0.1),
            child:
                Column(children: [Image.asset(clickCells[index.toString()])]),
          ));
    } else if (23 == index) {
      w = GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            clickCell(23, false);
          },
          child: Padding(
            padding: const EdgeInsets.all(0.1),
            child:
                Column(children: [Image.asset(clickCells[index.toString()])]),
          ));
    } else if (37 == index) {
      w = GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            clickCell(37, false);
          },
          child: Padding(
            padding: const EdgeInsets.all(0.1),
            child:
                Column(children: [Image.asset(clickCells[index.toString()])]),
          ));
    } else if (39 == index) {
      w = GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            clickCell(39, false);
          },
          child: Padding(
            padding: const EdgeInsets.all(0.1),
            child:
                Column(children: [Image.asset(clickCells[index.toString()])]),
          ));
    } else if (pellets.contains(index)) {
      w = Padding(
        padding: const EdgeInsets.all(1.0),
        child: Column(children: [Image.asset("assets/images/dot.png")]),
      );
    } else if (barriers.contains(index)) {
      w = Padding(
        padding: const EdgeInsets.all(1.0),
        child: Column(children: [Image.asset("assets/images/wall.png")]),
      );
    } else if (blocks.contains(index)) {
      w = Padding(
        padding: const EdgeInsets.all(1.0),
        child: Container(
          color: Colors.black,
        ),
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
    debugPrint("left${(index % 15) * itemWidth + startLeft}");
    debugPrint("top${index ~/ 15 * itemWidth + startTop}");
    return Positioned(
        left: ((index % 15) * itemWidth).toInt() + startLeft,
        top: (index ~/ 15 * itemWidth).toInt() + startTop,
        width: itemWidth,
        height: itemWidth,
        child: w);
  }
}
