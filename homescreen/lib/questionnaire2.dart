import 'package:flutter/material.dart';
import 'package:homescreen/next_page.dart';

class Questionnaire2 extends StatefulWidget {
  const Questionnaire2({super.key});

  @override
  State<Questionnaire2> createState() => _Questionnaire2State();
}

class _Questionnaire2State extends State<Questionnaire2> {
  double _currentSliderValue = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              child: Container(
                  margin: const EdgeInsets.only(bottom: 60, left:30, right: 30),
                  width: 380,
                  height: 85,
                  decoration: const BoxDecoration(
                      color: Color(0xFFEBCDB3),
                      borderRadius: BorderRadius.all(Radius.circular(30))
                  ),
                  alignment: Alignment.center,
                  child: Container (
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      child: const Text (
                          'Using the bar below, rate how you feel right now:\nUsing the bar below, rate how you feel right now:',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 19,
                            letterSpacing: 0.75,
                          )
                      )
                  )
              ),
            ),
            SliderTheme(
                data: const SliderThemeData(
                  trackShape: RectangularSliderTrackShape(),
                  trackHeight: 2,
                  activeTrackColor: Colors.black,
                  inactiveTrackColor: Colors.black,
                  thumbColor: Colors.teal,
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 13),
                  tickMarkShape: RoundSliderTickMarkShape(tickMarkRadius: 4),
                  activeTickMarkColor: Colors.teal,
                  inactiveTickMarkColor: Colors.teal,
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                  overlayColor: Colors.transparent,
                  showValueIndicator: ShowValueIndicator.never,
                ),
                child: Center(
                  child: Slider(
                      value: _currentSliderValue,
                      max: 100,
                      divisions: 6,
                      label: _currentSliderValue.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _currentSliderValue = value;
                        });
                      }
                  ),
                )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: const Text('Pessismistic',
                        style: TextStyle(fontSize: 15,
                            letterSpacing: 0.5)
                    )
                ),
                Container(
                    margin: const EdgeInsets.only(left: 220, right: 10),
                    child: const Text('Optimistic',
                        style: TextStyle(fontSize: 15,
                            letterSpacing: 0.5)
                    )
                )
              ],
            ),
            Container(
                margin: const EdgeInsets.only(left: 10, right: 10, top: 60),
                child:
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const NextPage())
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(160, 60),
                      backgroundColor: Colors.teal,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)),
                      elevation: 2.0,),
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
    );
  }
}