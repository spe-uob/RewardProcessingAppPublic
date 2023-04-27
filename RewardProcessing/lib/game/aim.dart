import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rewardprocessing/game/game_map.dart';

class Aim extends StatefulWidget {
  final String id;
  const Aim({super.key, required this.id});

  @override
  State<Aim> createState() => _AimState();
}

class _AimState extends State<Aim> {
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
            body: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text('THE AIM OF THE GAME:',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 24,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          )
                      ),
                      Container(
                          margin: const EdgeInsets.only(right :50, left: 50, top: 20, bottom: 10),
                          child: RichText(
                              text: const TextSpan(
                                  style: TextStyle(color: Colors.blue), //apply style to all
                                  children: [
                                    TextSpan(
                                      text: 'Your goal is to',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black
                                      )
                                    ),
                                    TextSpan(
                                        text: ' eat as many cherries as possible',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold
                                        )
                                    )
                                  ]
                              )
                          )
                      ),
                      Container(
                          margin: const EdgeInsets.only(right :50, left: 50, top: 10, bottom: 10),
                          child: RichText(
                              text: const TextSpan(
                                  style: TextStyle(color: Colors.blue), //apply style to all
                                  children: [
                                    TextSpan(
                                        text: 'Each cherry will earn you some points and you need to get',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black
                                        )
                                    ),
                                    TextSpan(
                                        text: ' 200 points to win the game,\n',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold
                                        )
                                    ),
                                    TextSpan(
                                        text: ' or the game will end after a',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                        )
                                    ),
                                    TextSpan(
                                        text: ' a time limit of 10 minutes',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold
                                        )
                                    ),
                                    TextSpan(
                                        text: ' has been reached.',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                        )
                                    )
                                  ]
                              )
                          )
                      ),
                      Container(
                          margin: const EdgeInsets.only(right :50, left: 50, top: 10, bottom: 10),
                          child: const Text('You will learn how to better find cherries the more you play the game.',
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.visible,
                              style: TextStyle(fontSize: 16,
                                  color: Colors.black
                              )
                          )
                      ),
                      Container(
                          margin: const EdgeInsets.only(right :50, left: 50, top: 10, bottom: 30),
                          child: const Text('GOOD LUCK!',
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.visible,
                              style: TextStyle(fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                              )
                          )
                      ),
                      Container(
                          margin: const EdgeInsets.only(left: 10, right: 10),
                          child: ElevatedButton(
                              onPressed: () async {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => GameMap(id: widget.id))
                                );
                                await FirebaseFirestore.instance
                                    .collection('game1')
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
                                fixedSize: const Size(120, 50),
                                backgroundColor: const Color(0xFF00A8AF),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100)
                                ),
                                elevation: 2.0
                              ),
                              child: const Text(
                                  'Start',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300
                                  )
                              )
                          )
                      )
                    ]
                )
              ]
            )
        )
    );
  }
}