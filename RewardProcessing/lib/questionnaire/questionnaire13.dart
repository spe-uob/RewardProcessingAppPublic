import 'package:flutter/material.dart';
import 'package:rewardprocessing/questionnaire/questionnaire14.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rewardprocessing/questionnaire/complete.dart';

class Questionnaire13 extends StatefulWidget {
  final String id;
  final String day;
  const Questionnaire13({super.key, required this.id, required this.day});

  @override
  State<Questionnaire13> createState() => _Questionnaire13State();
}

class _Questionnaire13State extends State<Questionnaire13> {
  int? _value = 0;
  bool activeButton = false;
  late String text;

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
                          margin: const EdgeInsets.only(bottom: 50, left:30, right: 30),
                          width: 380,
                          height: 100,
                          decoration: const BoxDecoration(
                              color:Color(0xFFFFD9A0),
                              borderRadius: BorderRadius.all(Radius.circular(30))
                          ),
                          alignment: Alignment.center,
                          child: Container (
                              margin: const EdgeInsets.only(left: 20, right: 20),
                              child: const Text (
                                  'In the last 24 hours, has an event or experience significantly affected your mood?',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 15,
                                    letterSpacing: 0.75,
                                  )
                              )
                          )
                      )
                  ),
                  Row(
                      children: <Widget>[
                        SizedBox(
                            child: Container(
                              margin: const EdgeInsets.only(right: 35),
                            )
                        ),
                        Radio(
                            value: 1,
                            groupValue: _value,
                            activeColor: const Color(0xFF00A8AF),
                            onChanged: (value){
                              setState(() {
                                _value = value;
                                activeButton = true;
                                text = 'Yes';
                              });
                            }
                        ),
                        const Text('Yes',
                            style: TextStyle(
                                fontSize: 16
                            )
                        )
                      ]
                  ),
                  Row(
                      children: <Widget>[
                        SizedBox(
                            child: Container(
                              margin: const EdgeInsets.only(right: 35),
                            )
                        ),
                        Radio(
                            value: 2,
                            groupValue: _value,
                            activeColor: const Color(0xFF00A8AF),
                            onChanged: (value){
                              setState(() {
                                _value = value;
                                activeButton = true;
                                text = 'No';
                              });
                            }
                        ),
                        const Text('No',
                            style: TextStyle(
                              fontSize: 16,
                            )
                        )
                      ]
                  ),
                  Container(
                      margin: const EdgeInsets.only(left: 10, right: 10, top: 52),
                      child: ElevatedButton(
                          onPressed: activeButton ? () async {
                            if (_value != 2) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Questionnaire14(
                                          id: widget.id, day: widget.day)
                                  )
                              );
                            }
                            else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Complete(id: widget.id, day: widget.day)
                                  )
                              );
                            }
                            await FirebaseFirestore.instance
                                .collection('participants')
                                .doc(widget.id)
                                .collection(widget.day)
                                .doc('questionnaire')
                                .set({'13. In the last 24 hours, has an event or experience significantly affected your mood?': text},
                                SetOptions(merge: true));
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
                    animationDuration: 1000,
                    percent: 13/16,
                    center: const Text('13/16'),
                    barRadius: const Radius.circular(30),
                    backgroundColor: const Color(0xFFDCDCDC),
                    progressColor: const Color(0xFF32BEC4)
                )
            )
        )
    );
  }
}