import 'package:flutter/material.dart';
import 'package:homescreen/questionnaire4.dart';

class Questionnaire3 extends StatefulWidget {
  const Questionnaire3({super.key});

  @override
  State<Questionnaire3> createState() => _Questionnaire3State();
}

class _Questionnaire3State extends State<Questionnaire3> {
  double _currentSliderValue = 50;
 bool flag=false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
      return false; // disable back page
    }, child: Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              child: Container(
                  margin: const EdgeInsets.only(bottom: 60, left:30, right: 30),
                  width: 380,
                  height: 85,
                  decoration: const BoxDecoration(
                      color: Color(0xFFFFD9A0),
                      borderRadius: BorderRadius.all(Radius.circular(30))
                  ),
                  alignment: Alignment.center,
                  child: Container (
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      child: const Text (
                          'Using the bar below, rate how you feel right now:',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 19,
                            letterSpacing: 0.75,
                              color: Colors.black
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
                  child: Slider(
                      value: _currentSliderValue,
                      max: 100,
                      divisions: 6,
                      label: _currentSliderValue.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _currentSliderValue = value;
                          flag=true;
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
                    child: const Text('Apathetic',
                        style: TextStyle(fontSize: 15,
                            letterSpacing: 0.5)
                    )
                ),
                Container(
                    margin: const EdgeInsets.only(left: 220, right: 10),
                    child: const Text('Motivated',
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
                    onPressed:flag? () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Questionnaire4())
                      );
                    }:null,
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(160, 60),
                      backgroundColor: const Color(0xFF00A8AF),
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
            ),
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(left:10,top: 80),
                  height: 13,
                  width:255,
                  decoration:BoxDecoration(
                    color: Color(0xffD7D7D7),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  margin:EdgeInsets.only(left:10,top: 80),
                  height:13,
                  width:45,
                  decoration: BoxDecoration(
                    color: Color(0xFF00A8AF),
                    borderRadius:BorderRadius.circular(10),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left:120,top:65),
                  child: const Text('3/16'
                  ),
                )
              ],
            ),
          ]
      ),
    ),
    );
  }
}