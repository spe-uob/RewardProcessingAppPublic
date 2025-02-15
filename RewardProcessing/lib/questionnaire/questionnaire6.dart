import 'package:flutter/material.dart';
import 'package:rewardprocessing/questionnaire/my_slider.dart';
import 'package:rewardprocessing/questionnaire/questionnaire7.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Questionnaire6 extends StatefulWidget {
  final String id;
  final String day;
  const Questionnaire6({super.key, required this.id, required this.day});

  @override
  State<Questionnaire6> createState() => _Questionnaire6State();
}

class _Questionnaire6State extends State<Questionnaire6> {
  double _currentSliderValue = 0;
  bool activeButton = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return false; // disable back page
        },
        child: Scaffold(
            body:
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        child: Container(
                            margin: const EdgeInsets.only(bottom: 60, left: 30, right: 30),
                            width: 380,
                            height: 85,
                            decoration: const BoxDecoration(
                                color: Color(0xFFFFD9A0),
                                borderRadius: BorderRadius.all(Radius.circular(30)
                                )
                            ),
                            alignment: Alignment.center,
                            child: Container(
                                margin: const EdgeInsets.only(left: 20, right: 20),
                                child: const Text(
                                    'Using the sliding scale below, rate how you feel right now:',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 17,
                                        letterSpacing: 0.75,
                                        color: Colors.black)
                                )
                            )
                        )
                    ),
                      SliderTheme(
                          data: const SliderThemeData(
                            trackShape: RectangularSliderTrackShape(),
                            trackHeight: 2,
                            activeTrackColor: Colors.black,
                            inactiveTrackColor: Colors.black,
                            thumbColor: Color(0xFF00A8AF),
                            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 13),
                            tickMarkShape: RoundSliderTickMarkShape(tickMarkRadius: 4),
                            activeTickMarkColor: Color(0xFF00A8AF),
                            inactiveTickMarkColor: Color(0xFF00A8AF),
                            overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                            overlayColor: Colors.transparent,
                            showValueIndicator: ShowValueIndicator.never,
                          ),
                          child: Center(
                            child: MySlider(
                                value: _currentSliderValue,
                                min: -3,
                                max: 3,
                                divisions: 6,
                                label: _currentSliderValue.round().toString(),
                                onChanged: (double value) {
                                  setState(() {
                                    _currentSliderValue = value;
                                    activeButton = true;
                                  });
                                }),
                          )
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                margin: const EdgeInsets.only(left: 10),
                                child: const Text('Withdrawn',
                                    style:
                                    TextStyle(fontSize: 15, letterSpacing: 0.5)
                                )
                            ),
                            Container(
                                margin: const EdgeInsets.only(left: 190, right: 10),
                                child: const Text('Welcoming',
                                    style: TextStyle(fontSize: 15, letterSpacing: 0.5)
                                )
                            )
                          ]
                      ),
                      Container(
                          margin: const EdgeInsets.only(left: 10, right: 10, top: 60),
                          child: ElevatedButton(
                              onPressed: activeButton ? () async {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Questionnaire7(id: widget.id, day: widget.day)
                                    )
                                );
                                await FirebaseFirestore.instance
                                    .collection('participants')
                                    .doc(widget.id)
                                    .collection(widget.day)
                                    .doc('questionnaire')
                                    .set({'06. Withdrawn/Welcoming (-3/3)': _currentSliderValue},
                                    SetOptions(merge: true)
                                );
                              } : null,
                              style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(160, 60),
                                  backgroundColor: const Color(0xFF00A8AF),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100)
                                  ),
                                  elevation: 2.0),
                              child: const Text('Continue',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w300
                                  )
                              )
                          )
                      )
                    ]
                ),
            bottomSheet: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, bottom: 80),
                child: LinearPercentIndicator(
                    animateFromLastPercent: true,
                    lineHeight: 20.0,
                    animationDuration: 1000,
                    percent: 6 / 16,
                    center: const Text('6/16'),
                    barRadius: const Radius.circular(30),
                    backgroundColor: const Color(0xFFDCDCDC),
                    progressColor: const Color(0xFF32BEC4)
                )
            )
        )
    );
  }
}