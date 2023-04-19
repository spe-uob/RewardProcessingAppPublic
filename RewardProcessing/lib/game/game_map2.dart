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
int col = row * 11;
int player = 49;
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

  List<int> leftGuess = [13, 23, 25];
  List<int> rightGuess = [19, 29, 31];

  int fresh = 0;

  List<int> guess = [13, 19, 23, 25, 29, 31];
  double topHeight = 60;
  int quarterTurns = 0;
  List<int> back = [12, 14, 18, 20];
  String leftImage13 = "assets/images/guess.png";
  String leftImage23 = "assets/images/guess.png";

  String leftImage25 = "assets/images/guess.png";

  String rightImage19 = "assets/images/guess.png";
  String rightImage29 = "assets/images/guess.png";
  String rightImage31 = "assets/images/guess.png";

  List<int> paths = [
    24,
    30,
    41,
    35,
    46,
    45,
    48,
    49,
    50,
    52,
    53,
    56,
    59,
    61,
    64,
    67,
    68,
    69,
    70,
    72,
    73,
    74,
    75
  ];
  List<int> pellets = [
    24,
    35,
    46,
    48,
    50,
    52,
    30,
    41,
    45,
    56,
    67,
    68,
    69,
    70,
    59,
    61,
    72,
    73,
    74,
    75,
    64,
    53,
    13,
    19,
    23,
    25,
    29,
    31
  ];

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
    47,
    51,
    54,
    55,
    57,
    58,
    60,
    62,
    63,
    65,
    66,
    71,
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
    86,
    87
  ];
  int guessIndex = -1;
  List guessesLeft = [13, 23, 25];
  List guessesRight = [19, 29, 31];

  Map clickCells = {
    "13": "assets/images/guess.png",
    "23": "assets/images/guess.png",
    "25": "assets/images/guess.png",
    "19": "assets/images/guess.png",
    "29": "assets/images/guess.png",
    "31": "assets/images/guess.png",
  };

  bool leftIsEmpty = false;
  bool rightIsEmpty = false;

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
    if (player == 35 || player == 41) {
      if (fresh != 0) {
        leftImage13 = "assets/images/guess.png";
        leftImage23 = "assets/images/guess.png";
        leftImage25 = "assets/images/guess.png";
        rightImage19 = "assets/images/guess.png";
        rightImage29 = "assets/images/guess.png";
        rightImage31 = "assets/images/guess.png";
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

    int lastPlayer = player;

    if (paths.contains(nowPlayer)) {
      setState(() {
        player = nowPlayer;
      });
    }
    if (lastPlayer != player) {
      if (player == 24 || player == 30) {
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

    if (player == 49) {
      leftIsEmpty = false;
      rightIsEmpty = false;
    }
    setState(() {});
  }

  void randomCanGuess(changeDrection) {
    if (player == 24) {
      if (guessIndex == -1) {
        guessIndex = guessesLeft[Random().nextInt(guessesLeft.length)];
        if (changeDrection) {
          if (guessIndex == 13) {
            quarterTurns = -1;
          }
          if (guessIndex == 23) {
            quarterTurns = -2;
          }
          if (guessIndex == 25) {
            quarterTurns = 0;
          }
        }

        clickCells[guessIndex.toString()] = "assets/images/thisguess.png";
      }
    }
    if (player == 30) {
      if (guessIndex == -1) {
        guessIndex = guessesRight[Random().nextInt(guessesRight.length)];
        if (changeDrection) {
          if (guessIndex == 19) {
            quarterTurns = -1;
          }
          if (guessIndex == 29) {
            quarterTurns = -2;
          }
          if (guessIndex == 31) {
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
      clickCells["13"] = "assets/images/ghost.png";
      clickCells["23"] = "assets/images/ghost.png";
      clickCells["25"] = "assets/images/ghost.png";
    } else {
      clickCells["19"] = "assets/images/ghost.png";
      clickCells["29"] = "assets/images/ghost.png";
      clickCells["31"] = "assets/images/ghost.png";
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
          nextShow();
          fresh++;
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
    for (int i = 0; i < 8; i++) {
      for (int j = 0; j < 11; j++) {
        items.add(getWidget(i * 11 + j));
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
                      width: 600.0,
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
    if (itemWidth > (MediaQuery.of(context).size.width / 11)) {
      itemWidth = MediaQuery.of(context).size.width / 11;
    }
    Widget w;

    double startLeft = (MediaQuery.of(context).size.width - itemWidth * 11) / 2;
    double startTop =
        ((MediaQuery.of(context).size.height - topHeight) - itemWidth * 8) / 2;
    if (26 == index) {
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
                Column(children: [Image.asset("assets/images/LeftClick.png")]),
          ));
    } else if (28 == index) {
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
                Column(children: [Image.asset("assets/images/RightClick.png")]),
          ));
    } else if (16 == index) {
      w = GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            movePlayer(0, -1);
            trigger();
            refresh();
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
            refresh();
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
    } else if (13 == index) {
      w = GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            clickCell(13, true);
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
            clickCell(23, true);
          },
          child: Padding(
            padding: const EdgeInsets.all(0.1),
            child:
                Column(children: [Image.asset(clickCells[index.toString()])]),
          ));
    } else if (25 == index) {
      w = GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            clickCell(25, true);
          },
          child: Padding(
            padding: const EdgeInsets.all(0.1),
            child:
                Column(children: [Image.asset(clickCells[index.toString()])]),
          ));
    } else if (19 == index) {
      w = GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            clickCell(19, false);
          },
          child: Padding(
            padding: const EdgeInsets.all(0.1),
            child:
                Column(children: [Image.asset(clickCells[index.toString()])]),
          ));
    } else if (29 == index) {
      w = GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            clickCell(29, false);
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
            clickCell(31, false);
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
