import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rewardprocessing/questionnaire/finishedquestion.dart';


class GameFinished2 extends StatefulWidget {
  final String id;
  const GameFinished2({super.key, required this.id});

  @override
  State<GameFinished2> createState() => _GameFinishedState2();
}

class _GameFinishedState2 extends State<GameFinished2> {
  double topHeight = 60;

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
        onWillPop: ()async {
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

            body:
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('assets/images/finishpage2.png',
                        fit:BoxFit.contain,
                        scale: 2,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => FinishedQuestion(
                                    id: widget.id)
                                )
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              fixedSize: const Size(300, 60),
                              backgroundColor: const Color(0xFF00A8AF),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100)
                              ),
                              elevation: 2.0
                          ),
                          child: const Text(
                              'CLICK HERE TO FINISH',
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