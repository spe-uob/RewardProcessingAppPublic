import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:rewardprocessing/game/game_finished.dart';

class GameMap extends StatefulWidget {
  final String id;
  const GameMap({super.key, required this.id});

  @override
  State<GameMap> createState() => _GameMapState();
}

int row = 8;
int col = row * 15;
int player = 65;
int score = 0;
double percentage = 0;

String imagePath = "assets/images/guess.png";
String leftImage = "assets/images/guess.png";
String rightImage = "assets/images/guess.png";

class _GameMapState extends State<GameMap> {
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
          MaterialPageRoute(builder: (context) => GameFinished(id: widget.id)),
        );
        _timer.cancel(); //stop timer
      }
    });
  }

  List<int> leftGuess = [17,31,33];
  List<int> rightGuess = [23,37,39];
  List<int> guess = [17,31,33,23,37,39];
  int fresh = 0;
  double topHeight = 60;
  int quarterTurns = 0;
  List<int> pellets = [
    32,
    47,
    62,
    63,
    64,
    66,
    67,
    68,
    53,
    38

  ];
  List<int> paths = [
    32,
    47,
    62,
    63,
    64,
    66,
    67,
    68,
    53,
    38,
    65

  ];
  String leftImage17 = "assets/images/guess.png";
  String leftImage31 = "assets/images/guess.png";
  String leftImage33 = "assets/images/guess.png";
  String rightImage23 = "assets/images/guess.png";
  String rightImage37 = "assets/images/guess.png";
  String rightImage49 = "assets/images/guess.png";
  Map clickCells = {
    "17": "assets/images/guess.png",
    "31": "assets/images/guess.png",
    "33": "assets/images/guess.png",
    "23": "assets/images/guess.png",
    "37": "assets/images/guess.png",
    "39": "assets/images/guess.png",
  };
  int guessIndex = -1;
  List guessesLeft = [17,31,33];
  List guessesRight = [23,37,39];
  bool leftIsEmpty = false;
  bool rightIsEmpty = false;

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
    76,
    77,
    78,
    79,
    80,
    81,
    82,
    83,
    84,
    85,
    70,
    55,
    40,
    25,
    46,
    61,
    48,
    19,
    34,
    49,
    20,
    35,
    50,
    21,
    36,
    51,
    52,
    54,
    69

  ];

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    _timer.cancel();
  }

  void trigger() {
    if (pellets.contains(player)) {
      pellets.remove(player);
      calculate(0);
    }
  }

  void calculate(int type) {
    if (score >= 200) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => GameFinished(id: widget.id)));
    }

    if (type == 0) {
      score = score + 1;
    } else if (type == 1) {
      score = score + 5;
    }

    if (score <= 200) {
      percentage = score / 2;
    } else {
      percentage = 100;
    }
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
          randomCanGuess(true);
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

  void randomCanGuess(changeDrection) {
    if (player == 32) {
      if (guessIndex == -1) {
        guessIndex = guessesLeft[Random().nextInt(guessesLeft.length)];
        if (changeDrection) {
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
      if (guessIndex == -1) {
        guessIndex = guessesRight[Random().nextInt(guessesRight.length)];
        if (changeDrection) {
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
      randomCanGuess(true);
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
      var doubleValue = Random().nextDouble();
      if (image == "assets/images/thisguess.png") {
        if (leftIsEmpty || rightIsEmpty) {
          image = "assets/images/NoCherry.png";
          clickCells[index.toString()] = image;
          nextShow();
        } else if (doubleValue < 0.5) {
          image = "assets/images/cherry.png";
          clickCells[index.toString()] = image;

          fresh++;
        } else if (doubleValue < 0.8) {
          if (left) {
            leftIsEmpty = true;
          } else {
            rightIsEmpty = true;
          }

          allGhost(left);
          fresh++;
        } else {
          if (left) {
            leftIsEmpty = true;
          } else {
            rightIsEmpty = true;
          }
          image = "assets/images/NoCherry.png";
          clickCells[index.toString()] = image;
          fresh++;
          nextShow();
        }
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
    for (int i = 0; i < 6; i++) {
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

  Widget getWidget(int index) {
    double itemWidth = (MediaQuery.of(context).size.height - topHeight) / row;
    if (itemWidth > (MediaQuery.of(context).size.width / 15)) {
      itemWidth = MediaQuery.of(context).size.width / 15;
    }
    Widget w;

    double startLeft = (MediaQuery.of(context).size.width - itemWidth * 15) / 2;
    double startTop =
        ((MediaQuery.of(context).size.height - topHeight) - itemWidth * 6) / 2;
    if (57 == index) {
      w = GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            movePlayer(-1, 0);
            trigger();
          },
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child:
                Column(children: [Image.asset("assets/images/arrowleft.png")]),
          ));
    } else if (59 == index) {
      w = GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            movePlayer(1, 0);
            trigger();
          },
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child:
                Column(children: [Image.asset("assets/images/arrowright.png")]),
          ));
    } else if (28 == index) {
      w = GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            movePlayer(0, -1);
            trigger();
          },
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: Column(children: [Image.asset("assets/images/arrowup.png")]),
          ));
    } else if (88 == index) {
      w = GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            movePlayer(0, 1);
            trigger();
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
