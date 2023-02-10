import 'package:flutter/material.dart';
import 'package:rewardprocessing/questionnaire/questionnaire15.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter/services.dart';

class Questionnaire14 extends StatefulWidget {
  const Questionnaire14({super.key});

  @override
  State<Questionnaire14> createState() => _Questionnaire14State();
}

class _Questionnaire14State extends State<Questionnaire14> {
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
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    child: Container(
                        margin: const EdgeInsets.only(bottom: 60, left:30, right: 30),
                        width: 380,
                        height: 85,
                        decoration: const BoxDecoration(
                            color:Color(0xFFFFD9A0),
                            borderRadius: BorderRadius.all(Radius.circular(30))
                        ),
                        alignment: Alignment.center,
                        child: Container (
                            margin: const EdgeInsets.only(left: 20, right: 20),
                            child: const Text (
                                'Please indicate on the sliding scale how positive or negative the experience was for you',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 17,
                                  letterSpacing: 0.75,
                                )
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
                        showValueIndicator: ShowValueIndicator.always,
                        valueIndicatorColor: Color(0xFF00A8AF),
                        valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                      ),
                      child: Center(
                        child: Slider(
                            value: _currentSliderValue,
                            min: -100,
                            max: 100,
                            label: _currentSliderValue.round().toString(),
                            onChanged: (double value) {
                              setState(() {
                                _currentSliderValue = value;
                                activeButton = true;
                              });
                            }
                        )
                      )
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: const Text('Negative',
                              style: TextStyle(fontSize: 15,
                                  letterSpacing: 0.5)
                          )
                      ),
                      Container(
                          margin: const EdgeInsets.only(left: 220, right: 10),
                          child: const Text('Positive',
                              style: TextStyle(fontSize: 15,
                                  letterSpacing: 0.5)
                          )
                      )
                    ]
                  ),
                  Container(
                      margin: const EdgeInsets.only(left: 10, right: 10, top: 60),
                      child: ElevatedButton(
                          onPressed: activeButton ? () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const Questionnaire15())
                            );
                          }:null,
                          style: ElevatedButton.styleFrom(
                              fixedSize: const Size(160, 60),
                              backgroundColor: const Color(0xFF00A8AF),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100)
                              ),
                              elevation: 2.0
                          ),
                          child: const Text(
                              'Continue',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white,
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
                  animationDuration: 300,
                  percent: 14/16,
                  center: const Text('14/16'),
                  barRadius: const Radius.circular(30),
                  backgroundColor: const Color(0xFFDCDCDC),
                  progressColor: const Color(0xFF32BEC4)
              )
          )
        )
    );
  }
}