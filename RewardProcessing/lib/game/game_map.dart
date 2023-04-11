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

int row = 6;
int col = row * 12;
int player = 53;
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

  List<int> leftGuess = [14, 25, 27];
  List<int> rightGuess = [20, 31, 33];
  List<int> guess = [25, 14, 27, 33, 20, 31];
  int fresh = 0;
  double topHeight = 60;
  int quarterTurns = 0;
  List<int> pellets = [26, 38, 50, 51, 52, 54, 55, 56, 32, 44];
  List<int> paths = [26, 38, 50, 51, 52, 53, 54, 55, 56, 32, 44];
  String leftImage13 = "assets/images/guess.png";
  String leftImage23 = "assets/images/guess.png";
  String leftImage25 = "assets/images/guess.png";
  String rightImage19 = "assets/images/guess.png";
  String rightImage29 = "assets/images/guess.png";
  String rightImage31 = "assets/images/guess.png";
  Map clickCells = {
    "14": "assets/images/guess.png",
    "25": "assets/images/guess.png",
    "27": "assets/images/guess.png",
    "20": "assets/images/guess.png",
    "31": "assets/images/guess.png",
    "33": "assets/images/guess.png",
  };
  int guessIndex = -1;
  List guessesLeft = [14, 25, 27];
  List guessesRight = [20, 31, 33];
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
    11,
    12,
    16,
    17,
    18,
    22,
    23,
    24,
    28,
    29,
    30,
    34,
    35,
    36,
    37,
    39,
    40,
    41,
    42,
    43,
    45,
    46,
    47,
    48,
    49,
    57,
    58,
    59,
    60,
    61,
    62,
    63,
    64,
    65,
    66,
    67,
    68,
    69,
    70,
    71
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
    int nowPlayer = player + down * 12 + right;

    if (down == 0) {
      int c = player % 12 - nowPlayer % 12;
      if (c != -1 && c != 1) {
        nowPlayer = player;
      }
    }
    if (right == 0) {
      int c = player ~/ 12 - nowPlayer ~/ 12;
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
      if (player == 26 || player == 32) {
        if (guessIndex == -1) {
          randomCanGuess(lastPlayer == player);
        }
      } else {
        setState(() {
          allGuess();
        });
      }
    }

    if (player == 53) {
      leftIsEmpty = false;
      rightIsEmpty = false;
    }
    setState(() {});
  }

  void randomCanGuess(changeDrection) {
    if (player == 26) {
      if (guessIndex == -1) {
        guessIndex = guessesLeft[Random().nextInt(guessesLeft.length)];
        if (changeDrection) {
          if (guessIndex == 14) {
            quarterTurns = -1;
          }
          if (guessIndex == 25) {
            quarterTurns = -2;
          }
          if (guessIndex == 27) {
            quarterTurns = 0;
          }
        }

        clickCells[guessIndex.toString()] = "assets/images/thisguess.png";
      }
    }
    if (player == 32) {
      if (guessIndex == -1) {
        guessIndex = guessesRight[Random().nextInt(guessesRight.length)];
        if (changeDrection) {
          if (guessIndex == 20) {
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
      clickCells["14"] = "assets/images/ghost.png";
      clickCells["25"] = "assets/images/ghost.png";
      clickCells["27"] = "assets/images/ghost.png";
    } else {
      clickCells["20"] = "assets/images/ghost.png";
      clickCells["31"] = "assets/images/ghost.png";
      clickCells["33"] = "assets/images/ghost.png";
    }
  }

  void clickCell(int index, bool left) {
    String image = clickCells[index.toString()];
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
      for (int j = 0; j < 12; j++) {
        items.add(getWidget(i * 12 + j));
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
    if (itemWidth > (MediaQuery.of(context).size.width / 11)) {
      itemWidth = MediaQuery.of(context).size.width / 11;
    }
    Widget w;

    double startLeft = (MediaQuery.of(context).size.width - itemWidth * 11) / 2;
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
                Column(children: [Image.asset("assets/images/LeftClick.png")]),
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
                Column(children: [Image.asset("assets/images/RightClick.png")]),
          ));
    } else if (46 == index) {
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
    } else if (70 == index) {
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
    } else if (14 == index) {
      w = GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            clickCell(14, true);
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
    } else if (27 == index) {
      w = GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            clickCell(27, true);
          },
          child: Padding(
            padding: const EdgeInsets.all(0.1),
            child:
                Column(children: [Image.asset(clickCells[index.toString()])]),
          ));
    } else if (20 == index) {
      w = GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            clickCell(20, false);
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
    } else if (33 == index) {
      w = GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            clickCell(33, false);
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
    debugPrint("left${(index % 12) * itemWidth + startLeft}");
    debugPrint("top${index ~/ 12 * itemWidth + startTop}");
    return Positioned(
        left: ((index % 12) * itemWidth).toInt() + startLeft,
        top: (index ~/ 12 * itemWidth).toInt() + startTop,
        width: itemWidth,
        height: itemWidth,
        child: w);
  }
}
