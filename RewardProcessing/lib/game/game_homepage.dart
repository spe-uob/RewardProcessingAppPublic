import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    int numberInRow = 11;
    int numberOfSquares = numberInRow * 17;

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
    // using scaffold widget as the main parent of the page
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Column(children: [
        Expanded(
          flex: 5,
          child: Container(
          )
        ),
        Expanded(
          child: Container(
              color: Colors.pink
          )
        )
      ])
    );
  }
}