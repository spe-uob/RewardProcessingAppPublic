//Introduction: This page is for level 1
//and it contains everything related to level one
//including the game map
//Pac-Man's movement and turning
//the random selection of the guess box
//clicking the button
//score bar
//the scoring mechanism
//the probability of the inactive site and active site switches.
//and data storage on Firebase.
import 'dart:async';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
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

//Create a map for 8 rows and 15 columns
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
  late String reward; // the reward will be initialised in the game logic
  late String activeSide; // activeSide will be initialised in the game logic
  String agentSide = 'N'; // agentSide starts with N but will be initialised in the game logic
  late String end; // this is the message that will pop up due to the completeness of the player

  @override
  void initState() {
    super.initState();
    leftActive = Random().nextDouble() > 0.5;
    if (leftActive == true) {
      activeSide = 'Left';
    } else if (leftActive == false) {
      activeSide = 'Right';
    }
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    // count 5 minutes
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _seconds++;
      });

      if (_seconds > 300 || score >= 200) {
        popup(context); // call the popup message
        _timer.cancel(); //stop timer
      }
    });
  }

  List<int> leftGuess = [17, 31, 33]; // guess boxes of left site
  List<int> rightGuess = [23, 37, 39];  // guess boxes of right site
  List<int> guess = [17, 31, 33, 23, 37, 39];
  int fresh = 0;
  double topHeight = 60;
  int quarterTurns = 0;   //pacman turns 4 directions
  List<int> pellets = [32, 47, 62, 63, 64, 66, 67, 68, 53, 38];
  List<int> paths = [32, 47, 62, 63, 64, 65, 66, 67, 68, 53, 38]; //path is where pacman can move
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

  // logic related variables are here

  // guessIndex indicate clickable guessbox. -1 indicate non-clickable guess box
  int guessIndex = -1;

  // guess box of left and right sites
  List guessesLeft = [17, 31, 33];
  List guessesRight = [23, 37, 39];

  // left site is active
  bool leftActive = true;

  // If it's the first time you click an inactive site (the first time ghost appear)
  bool inactiveFirstClicked = false;

  // active site probability
  double cherryProbability = 0.8;
  double emptyProbability = 0.2;

  // site switching happens when a player finds a reward in an active site
  double switchInactiveProbability = 0.3;

  //pacman moved by click the button
  bool newMove = false;   //clicked the button but doesn't move to other gird

  // barriers index
  List<int> barriers = [0,1,2,3,4,5,6,7,8,9,10,15,30,45,60,75,76,77,78,79,80,81,
    82,83,84,85,70,55,40,25,46,61,48,19,34,49,20,35,50,21,36,
    51,52,54,69];

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    _timer.cancel();
  }

  void trigger() {
    if (pellets.contains(player)) {
      // The action of pacman eating pellets
      pellets.remove(player);
      calculate(0);
    }
  }

  // Calculating the score
  Future<void> calculate(int type) async {

    if (type == 0) {
      score = score + 1; // +1 point for each pellet
    } else if (type == 1) {
      score = score + 5; // +5 point for finding a cherry
    }

    if (score < 200) {
      percentage = score / 2; // (score / 200) * 100 = score / 2
      end = "Time's up!"; // if the score is not completed, the it means the time's up
    } else {
      score = 200;
      percentage = 100; // when the score exceeds 200, the percentage stays 100
      end = 'Level 1 Complete!';
    }
  }

  // a message pops up once the time is up or when the user reaches 200 points
  void popup(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            end,
            textAlign: TextAlign.center,
          ),
          content: const Text(
            'Please click the button below to continue.',
            textAlign: TextAlign.center,
          ),
          actions: [
            Row (
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                        onPressed: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => GameFinished(id: widget.id)),
                          );
                          await FirebaseFirestore.instance
                              .collection('game1')
                              .doc(widget.id)
                              .set({Timestamp.now().toString(): [
                            end,
                            "Final Score: $score/200",
                            "Percentage Complete: $percentage%"
                          ]},
                              SetOptions(merge: true)
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(160, 60),
                          backgroundColor: const Color(0xFF00A8AF),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100)
                          ),
                          elevation: 2.0,
                        ),
                        child: const Text(
                            'Continue',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w300
                            )
                        )
                    )
                )
              ],
            )
          ],
        );
      },
    );
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
    // the pacman turns 4 directions
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
      if (player == 32 || player == 38) { // when the pacman is either on the left/right site
        if (guessIndex == -1) {
          newMove = true;
          randomCanGuess(true, true);
        }
      } else {
        setState(() {
          allGuess();
        }
        );
      }
    }
    setState(() {});
  }

  // refresh
  void randomCanGuess(bool firstEnter, bool changeDirection) {
    if (player == 32) {
      // left site
      agentSide = 'Left';

      if (leftActive) {
        var randomValue = Random().nextDouble();
        if (randomValue < switchInactiveProbability && !firstEnter) {
          // there's a 0.3 probability of switching to inactive
          leftActive = false;
          activeSide = 'Right';
        }
      }
      inactiveFirstClicked = firstEnter ? false : true;
      if (guessIndex == -1) {
        guessIndex = guessesLeft[Random().nextInt(guessesLeft.length)];
        if (changeDirection) {
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
      // right site
      agentSide = 'Right';

      if (!leftActive) {
        var randomValue = Random().nextDouble();
        if (randomValue < switchInactiveProbability && !firstEnter) {
          // there's a 0.3 probability of switching to inactive
          leftActive = true;
          activeSide = 'Left';
        }
      }
      inactiveFirstClicked = firstEnter ? false : true;
      if (guessIndex == -1) {
        guessIndex = guessesRight[Random().nextInt(guessesRight.length)];
        if (changeDirection) {
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
    debugPrint(
        "State,leftActive=$leftActive,inactiveFirstClicked=$inactiveFirstClicked");
  }

  // switch guess box every 1 second
  void nextShow() {
    Future.delayed(const Duration(seconds: 1), () {
      if (!newMove) {
        // No movement yet before refreshing
        // it solves the problem of multiple fast movements
        setState(() {
          allGuess();
          guessIndex = -1;
        });
        randomCanGuess(false, true);
      }
    });
  }

  //all become the guess boxes
  void allGuess() {
    guessIndex = -1;
    for (var a in clickCells.keys) {
      clickCells[a] = "assets/images/guess.png";
    }
  }

  // all ghosts appear
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

  // when a cell is clicked
  Future<void> clickCell(int index, bool left) async {
    String image = clickCells[index.toString()];
    if (image == "assets/images/guess.png") {
      // guess click return
      return;
    }
    newMove = false;
    if (guessIndex != -1) {
      guessIndex = -1;
      var randomValue = Random().nextDouble();
      bool ghost = false;
      if (image == "assets/images/thisguess.png") {
        if (left && !leftActive) {
          // click the left side and it's invalid
          if (!inactiveFirstClicked) {
            // becomes inactive
            allGhost(left);
            ghost = true;

            // ghost appears
            reward = 'Ghosts appear'; // will be used later when 'clickCell' is called

            // data storage of guess box selected
            await FirebaseFirestore.instance
                .collection('game1')
                .doc(widget.id)
                .set({Timestamp.now().toString(): [
              "Guess box selected",
              "Score: $score",
              "Active Side: $activeSide",
              "Agent Side: $agentSide",
              "Percentage Complete: $percentage%"
            ]},
                SetOptions(merge: true)
            );
          } else {
            // empty guess box
            image = "assets/images/NoCherry.png";
            clickCells[index.toString()] = image;
            fresh++;
            reward = 'Show no cherry'; // will be used later when 'clickCell' is called

            // data storage of guess box selected
            await FirebaseFirestore.instance
                .collection('game1')
                .doc(widget.id)
                .set({Timestamp.now().toString(): [
              "Guess box selected",
              "Score: $score",
              "Active Side: $activeSide",
              "Agent Side: $agentSide",
              "Percentage Complete: $percentage%"
            ]},
                SetOptions(merge: true)
            );
          }
        } else if (!left && leftActive) {
          // click the right side and it's invalid
          if (!inactiveFirstClicked) {
            // become inactive, without the first click
            allGhost(left);
            ghost = true;

            // ghosts appear
            reward = 'Ghosts appear'; // will be used later when 'clickCell' is called

            // data storage of guess box selected
            await FirebaseFirestore.instance
                .collection('game1')
                .doc(widget.id)
                .set({Timestamp.now().toString(): [
              "Guess box selected",
              "Score: $score",
              "Active Side: $activeSide",
              "Agent Side: $agentSide",
              "Percentage Complete: $percentage%"
            ]},
                SetOptions(merge: true)
            );
          } else {
            image = "assets/images/NoCherry.png";
            clickCells[index.toString()] = image;
            fresh++;

            // empty guess box
            reward = 'Show no cherry'; // will be used later when 'clickCell' is called

            // data storage of guess box selected
            await FirebaseFirestore.instance
                .collection('game1')
                .doc(widget.id)
                .set({Timestamp.now().toString(): [
              "Guess box selected",
              "Score: $score",
              "Active Side: $activeSide",
              "Agent Side: $agentSide",
              "Percentage Complete: $percentage%"
            ]},
                SetOptions(merge: true)
            );
          }
        } else {
          if (randomValue < cherryProbability) {
            // cherry
            image = "assets/images/cherry.png";
            clickCells[index.toString()] = image;
            fresh++;

            // reward (cherry) shows
            reward = 'Show cherry'; // will be used later when 'clickCell' is called

            // data storage of guess box selected
            await FirebaseFirestore.instance
                .collection('game1')
                .doc(widget.id)
                .set({Timestamp.now().toString(): [
              "Guess box selected",
              "Score: $score",
              "Active Side: $activeSide",
              "Agent Side: $agentSide",
              "Percentage Complete: $percentage%"
            ]},
                SetOptions(merge: true)
            );
          } else {
            image = "assets/images/NoCherry.png";
            clickCells[index.toString()] = image;
            fresh++;

            // empty guess box
            reward = 'Show no cherry'; // will be used later when 'clickCell' is called

            // data storage of guess box selected
            await FirebaseFirestore.instance
                .collection('game1')
                .doc(widget.id)
                .set({Timestamp.now().toString(): [
              "Guess box selected",
              "Score: $score",
              "Active Side: $activeSide",
              "Agent Side: $agentSide",
              "Percentage Complete: $percentage%"
            ]},
                SetOptions(merge: true)
            );
          }
        }
      }
      if (image != "assets/images/cherry.png" && !ghost) {
        nextShow();
      }
    } else if (image == "assets/images/cherry.png") {
      image = "assets/images/NoCherry.png";
      // image turing from cherry to empty guess box indicates that the cherry was selected
      clickCells[index.toString()] = image;
      fresh++;
      reward = 'Cherry selected'; // will be used later when 'clickCell' is called
      calculate(1); // score +5 for finding a cherry
      nextShow();
      allGuess();
    }

    debugPrint(
        "State2,leftActive=$leftActive,inactiveFirstClicked=$inactiveFirstClicked");

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
        body: Column(
            children: [
              Container(
                  height: topHeight - 10,
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: LinearPercentIndicator(
                          width: 450.0,
                          lineHeight: 16.0,
                          progressColor: Colors.teal[400],
                          backgroundColor: Colors.grey[400],
                          barRadius: const Radius.circular(10),
                          center: Text("$percentage%"),
                          leading: Text(
                            "Score: $score",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                color: Colors.black
                            ),
                          ),
                          percent: percentage / 100,
                        ),
                      ),
                      const Text(
                        "Target Goal: 200points",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                            color: Colors.black
                        ),
                      ),
                    ],
                  )
              ),
              Container(
                height: 10,
                color: const Color(0xffeeeeee),
              ),
              Expanded(
                child: Container(
                    color: Colors.black,
                    child: Stack(
                      children: items,
                    )
                ),
              )
            ]
        )
    );
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
      // left navigation button
      w = GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () async {
            movePlayer(-1, 0); // move the pacman to the left
            trigger();

            // data storage of the movement
            await FirebaseFirestore.instance
                .collection('game1')
                .doc(widget.id)
                .set({Timestamp.now().toString(): [
              "Left Click",
              "Score: $score",
              "Active Side: $activeSide",
              "Agent Side: $agentSide",
              "Percentage Complete: $percentage%"
            ]},
                SetOptions(merge: true)
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: Column(
                children: [
                  Image.asset("assets/images/arrowleft.png")
                ]
            ),
          )
      );
    } else if (59 == index) {
      // right navigation button
      w = GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () async {
            movePlayer(1, 0); // move the pacman to the right
            trigger();

            // data storage of the movement
            await FirebaseFirestore.instance
                .collection('game1')
                .doc(widget.id)
                .set({Timestamp.now().toString(): [
              "Right Click",
              "Score: $score",
              "Active Side: $activeSide",
              "Agent Side: $agentSide",
              "Percentage Complete: $percentage%"
            ]},
                SetOptions(merge: true)
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: Column(
                children: [
                  Image.asset("assets/images/arrowright.png")
                ]
            ),
          )
      );
    } else if (28 == index) {
      // up navigation button
      w = GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () async {
            movePlayer(0, -1); // move the pacman up
            trigger();

            // data storage of the movement
            await FirebaseFirestore.instance
                .collection('game1')
                .doc(widget.id)
                .set({Timestamp.now().toString(): [
              "Up Click",
              "Score: $score",
              "Active Side: $activeSide",
              "Agent Side: $agentSide",
              "Percentage Complete: $percentage%"
            ]},
                SetOptions(merge: true)
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: Column(
                children: [
                  Image.asset("assets/images/arrowup.png")
                ]
            ),
          )
      );
    } else if (88 == index) {
      // down navigation button
      w = GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () async {
            movePlayer(0, 1); // move the pacman down
            trigger();

            // data storage of the movement
            await FirebaseFirestore.instance
                .collection('game1')
                .doc(widget.id)
                .set({Timestamp.now().toString(): [
              "Down Click",
              "Score: $score",
              "Active Side: $activeSide",
              "Agent Side: $agentSide",
              "Percentage Complete: $percentage%"
            ]},
                SetOptions(merge: true)
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: Column(
                children: [
                  Image.asset("assets/images/arrowdown.png")
                ]
            ),
          )
      );
    } else if (player == index) {
      // The current grid shows pacman
      // quarterTurns indicates rotate direction
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
          )
      );
    } else if (17 == index) {
      // The guess box on top of the left grid
      w = GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () async {
            clickCell(17, true); // call 'clickCell'

            // data storage of the reward (empty, ghosts, show cherry, cherry selected)
            await FirebaseFirestore.instance
                .collection('game1')
                .doc(widget.id)
                .set({Timestamp.now().toString(): [
              reward,
              "Score: $score",
              "Active Side: $activeSide",
              "Agent Side: $agentSide",
              "Percentage Complete: $percentage%"
            ]},
                SetOptions(merge: true)
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(0.1),
            child: Column(
                children: [
                  Image.asset(clickCells[index.toString()])
                ]
            ),
          )
      );
    } else if (31 == index) {
      // The guess box on the left side of the left grid
      w = GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () async {
            clickCell(31, true); // call 'clickCell'

            // data storage of the reward (empty, ghosts, show cherry, cherry selected)
            await FirebaseFirestore.instance
                .collection('game1')
                .doc(widget.id)
                .set({Timestamp.now().toString(): [
              reward,
              "Score: $score",
              "Active Side: $activeSide",
              "Agent Side: $agentSide",
              "Percentage Complete: $percentage%"
            ]},
                SetOptions(merge: true)
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(0.1),
            child: Column(
                children: [
                  Image.asset(clickCells[index.toString()])
                ]
            ),
          )
      );
    } else if (33 == index) {
      // The guess box on the right side of left grid
      w = GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () async {
            clickCell(33, true); // call 'clickCell'

            // data storage of the reward (empty, ghosts, show cherry, cherry selected)
            await FirebaseFirestore.instance
                .collection('game1')
                .doc(widget.id)
                .set({Timestamp.now().toString(): [
              reward,
              "Score: $score",
              "Active Side: $activeSide",
              "Agent Side: $agentSide",
              "Percentage Complete: $percentage%"
            ]},
                SetOptions(merge: true)
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(0.1),
            child: Column(
                children: [
                  Image.asset(clickCells[index.toString()])
                ]
            ),
          )
      );
    } else if (23 == index) {
      //The guess box on top of on the right grid
      w = GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () async {
            clickCell(23, false); // call 'clickCell'

            // data storage of the reward (empty, ghosts, show cherry, cherry selected)
            await FirebaseFirestore.instance
                .collection('game1')
                .doc(widget.id)
                .set({Timestamp.now().toString(): [
              reward,
              "Score: $score",
              "Active Side: $activeSide",
              "Agent Side: $agentSide",
              "Percentage Complete: $percentage%"
            ]},
                SetOptions(merge: true)
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(0.1),
            child: Column(
                children: [
                  Image.asset(clickCells[index.toString()])
                ]
            ),
          )
      );
    } else if (37 == index) {
      // The guess box on the left side of the right grid
      w = GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () async {
            clickCell(37, false); // call 'clickCell'

            // data storage of the reward (empty, ghosts, show cherry, cherry selected)
            await FirebaseFirestore.instance
                .collection('game1')
                .doc(widget.id)
                .set({Timestamp.now().toString(): [
              reward,
              "Score: $score",
              "Active Side: $activeSide",
              "Agent Side: $agentSide",
              "Percentage Complete: $percentage%"
            ]},
                SetOptions(merge: true)
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(0.1),
            child: Column(
                children: [
                  Image.asset(clickCells[index.toString()])
                ]
            ),
          )
      );
    } else if (39 == index) {
      // The guess box on the right side of the right grid
      w = GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () async {
            clickCell(39, false); // call 'clickCell'

            // data storage of the reward (empty, ghosts, show cherry, cherry selected)
            await FirebaseFirestore.instance
                .collection('game1')
                .doc(widget.id)
                .set({Timestamp.now().toString(): [
              reward,
              "Score: $score",
              "Active Side: $activeSide",
              "Agent Side: $agentSide",
              "Percentage Complete: $percentage%"
            ]},
                SetOptions(merge: true)
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(0.1),
            child: Column(
                children: [
                  Image.asset(clickCells[index.toString()])
                ]
            ),
          )
      );
    } else if (pellets.contains(index)) {
      // generate pellets
      w = Padding(
        padding: const EdgeInsets.all(1.0),
        child: Column(
            children: [
              Image.asset("assets/images/dot.png")
            ]
        ),
      );
    } else if (barriers.contains(index)) {
      // generate barriers
      w = Padding(
        padding: const EdgeInsets.all(1.0),
        child: Column(
            children: [
              Image.asset("assets/images/wall.png")
            ]
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