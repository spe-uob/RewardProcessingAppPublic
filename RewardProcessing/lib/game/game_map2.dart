import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class GameMap2 extends StatefulWidget {
  const GameMap2({super.key});

  @override
  State<GameMap2> createState() => _GameMap2State();
}

int row = 8;
int col = row * 11;
int player = 49;

class _GameMap2State extends State<GameMap2> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  List<int> guess = [13, 19, 23, 25, 29, 31];
  double topHeight = 60;
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
    48,
    49,
    61,
    72,
    73,
    74,
    75,
    64,
    53
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
    51,
    65,
    61,
    62,
    63,
    64,
    55,
    56,
    26,
    38,
    44,
    33,
    28,
    40,
  ];
  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];
    for (int i = 0; i < 8; i++) {
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
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        size: 25,
                      )),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: LinearPercentIndicator(
                      width: 140.0,
                      lineHeight: 16,
                      progressColor: Colors.blue,
                      backgroundColor: Colors.grey,
                      center: const Text("0%"),
                      leading: const Text(
                        "Score:0",
                        style: TextStyle(color: Colors.black),
                      ),
                      percent: 0,
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    "Target Goal: 200points",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              )),
          Container(
            height: 10,
            color: const Color(0xffeeeeee),
          ),
          Expanded(
              child: Stack(
            children: items,
          ))
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
        ((MediaQuery.of(context).size.height - topHeight) - itemWidth * 8) / 2;
    if (26 == index) {
      w = Padding(
        padding: const EdgeInsets.all(1.0),
        child: Column(children: [Image.asset("assets/images/LeftClick.png")]),
      );
    } else if (28 == index) {
      w = Padding(
        padding: const EdgeInsets.all(1.0),
        child: Column(children: [Image.asset("assets/images/RightClick.png")]),
      );
    } else if (16 == index) {
      w = Padding(
        padding: const EdgeInsets.all(1.0),
        child: Column(children: [Image.asset("assets/images/UpClick.png")]),
      );
    } else if (28 == index) {
      w = Padding(
        padding: const EdgeInsets.all(1.0),
        child: Column(children: [Image.asset("assets/images/DownClick.png")]),
      );
    } else if (player == index) {
      w = Container(
        color: Colors.black,
        padding: const EdgeInsets.all(2.0),
        child: Column(children: [
          Image.asset(
            "assets/images/pacman.png",
            width: itemWidth - 10,
            height: itemWidth - 5,
          )
        ]),
      );
    }
    // else if (barriers.contains(index)) {
    //   w = Padding(
    //     padding: const EdgeInsets.all(1.0),
    //     child: Column(children: [Image.asset("assets/images/wall.png")]),
    //   );
    // }
    else if (guess.contains(index)) {
      w = Padding(
        padding: const EdgeInsets.all(1.0),
        child: Column(children: [Image.asset("assets/images/guess.png")]),
      );
    } else if (pellets.contains(index)) {
      w = Padding(
        padding: const EdgeInsets.all(1.0),
        child: Column(children: [Image.asset("assets/images/dot.png")]),
      );
    } else {
      w = Padding(
        padding: const EdgeInsets.all(1.0),
        child: Column(children: [Image.asset("assets/images/wall.png")]),
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
