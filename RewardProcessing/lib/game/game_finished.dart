import 'package:flutter/material.dart';
import 'package:rewardprocessing/game/game_map2.dart';
import 'package:flutter/services.dart';


class GameFinished extends StatefulWidget {
  final String id;
  const GameFinished({super.key, required this.id});

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
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => GameMap2(
                                    id: widget.id)
                                )
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(240, 50),
                            backgroundColor: const Color(0xFF00A8AF),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100)
                            ),
                            elevation: 2.0
                          ),
                          child: const Text(
<<<<<<< HEAD
                              'CONTINUES TO LEVEL2',
=======
                              'CONTINUE TO LEVEL 2',
>>>>>>> main
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                 // fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                              )
                          )
                      )
                    ]
                )]
            )
        )
    );
  }
}


