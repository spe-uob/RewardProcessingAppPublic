import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rewardprocessing/game/game_map2.dart';
import 'package:flutter/services.dart';

//script shown after completion of level1
//allows advancement to level2
class GameFinished extends StatefulWidget {
  final String id;
  const GameFinished({super.key, required this.id});

  @override
  State<GameFinished> createState() => _GameFinishedState();
}

class _GameFinishedState extends State<GameFinished> {
  double topHeight = 60;//height dimension of the game finish page

  @override
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([//Specifies the set of orientations the application interface can be displayed in
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: ()async {
          return false; // disable back page
        },
        child: Scaffold(//screen appearance parameters
            backgroundColor: const Color(0xff000000),
            extendBodyBehindAppBar: true,
            appBar:AppBar(
              toolbarHeight: 0,
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.transparent,
            ),

            body:
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('assets/images/finishpage1.png',//displays the status of the game
                      fit:BoxFit.contain,
                        scale: 2.5,
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const GameMap2(
                                    id: ''))
                            );
                            await FirebaseFirestore.instance
                                .collection('game2')
                                .doc(widget.id)
                                .set({'0. Game Details': [
                              'Site Switch Probability.: 0.3',
                              'Cherry Probability: 0.8',
                              'Active Site: 0.5 probability of being on the left/right at the start of every game.'
                            ]},
                                SetOptions(merge: true)
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(240, 50),
                            backgroundColor: const Color(0xFF00A8AF),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100)),
                            elevation: 2.0,),
                          child: const Text(
                              'CLICK HERE TO LEVLE2',//displays the button to push to advance to level2
                              textAlign: TextAlign.center,
                              style:TextStyle(
                                 // fontWeight: FontWeight.bold,
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


