import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class GameMap extends StatefulWidget {
  const GameMap({super.key});

  @override
  State<GameMap> createState() => _GameMapState();
}

int row = 8;
int col = row * 11;

class _GameMapState extends State<GameMap> {

    @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
    ]);
  }


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
    16,
    24,
    32,
    40,
    48,
    56,
    64,
    72,
    80,
    81,
    82,
    83,
    84,
    85,
    86,
    87,
    15,
    23,
    31,
    39,
    47,
    55,
    63,
    71,
    12,
    18,
    26,
    27,
    28,
    36,
    37,
    38,
    41,
    42,
    44,
    45,
    46,
    52,
    53,
    54,
    76,
    66,
    58,
    59,
    60,
    79
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        Expanded(
          flex: 6,
          // child: Container(
          child: GridView.builder(
              itemCount: col,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: row),
              itemBuilder: (BuildContext, int index) {
                if (barriers.contains(index)) {
                 return Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                    child: Container(
                      child: Text(index.toString()),
                      color: Colors.blue,
                      
                    ),
                  )
                  );
                } else {}
                return Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: ClipOval(
                  child: Container(
                    child: Text(index.toString()),
                    color: Color.fromARGB(255, 224, 237, 41),
                  ),
                )
                );
              }),
        ),
        Expanded(
            child: Column(
          children: [
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