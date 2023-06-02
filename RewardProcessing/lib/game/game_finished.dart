import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rewardprocessing/game/game_map2.dart';
import 'package:flutter/services.dart';


class GameFinished extends StatefulWidget {
  final String id;
  final String day;
  const GameFinished({super.key, required this.id, required this.day});

  @override
  State<GameFinished> createState() => _GameFinishedState();
}

class _GameFinishedState extends State<GameFinished> {
  double topHeight = 60;

  @override
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return false; // disable back page
        },
        child: Scaffold(
            backgroundColor: const Color(0xff000000),
            extendBodyBehindAppBar: true,
            appBar:AppBar(
              toolbarHeight: 0,
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.transparent,
            ),

            body: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('assets/images/finishpage1.png',
                        fit:BoxFit.contain,
                        scale: 2.5,
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => GameMap2(id: widget.id, day: widget.day))
                            );
                            await FirebaseFirestore.instance
                                .collection('participants')
                                .doc(widget.id)
                                .collection(widget.day)
                                .doc('game2')
                                .set({'0. Game Details': [
                              'Site Switch Probability: 0.3',
                              'Cherry Probability: 0.8',
                              'Active Site: 0.5 probability of being on the left/right at the start of every game.'
                            ]},
                                SetOptions(merge: true)
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(300, 60),
                            backgroundColor: const Color(0xFF00A8AF),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100)
                            ),
                            elevation: 2.0,
                          ),
                          child: const Text(
                              'CLICK HERE TO LEVEL 2',
                              textAlign: TextAlign.center,
                              style:TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              )
                          )
                      )
                    ]
                )
              ],
            )
        )
    );
  }
}