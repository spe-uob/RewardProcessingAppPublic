import 'package:flutter/material.dart';
import 'package:rewardprocessing/questionnaire/questionnaire16.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Questionnaire15 extends StatefulWidget {
  final String id;
  const Questionnaire15({super.key, required this.id});

  @override
  State<Questionnaire15> createState() => _Questionnaire15State();
}

class _Questionnaire15State extends State<Questionnaire15> {
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
                                  'Did you know the event/experience was going to occur before it happened?',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 17,
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
                                text = 'No - it was a complete surprise';
                              });
                            }
                        ),
                        const Text('No - it was a complete surprise',
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
                                text = 'Yes - on the day it happened';
                              });
                            }
                        ),
                        const Text('Yes - on the day it happened',
                            style: TextStyle(
                              fontSize: 16,
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
                            value: 3,
                            groupValue: _value,
                            activeColor: const Color(0xFF00A8AF),
                            onChanged: (value){
                              setState(() {
                                _value = value;
                                activeButton = true;
                                text = 'Yes - up to a week before it happened';
                              });
                            }
                        ),
                        const Text('Yes - up to a week before it happened',
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
                            value: 4,
                            groupValue: _value,
                            activeColor: const Color(0xFF00A8AF),
                            onChanged: (value){
                              setState(() {
                                _value = value;
                                activeButton = true;
                                text = 'Yes - I knew about it for more than a week before it happened';
                              });
                            }
                        ),
                        const Text('Yes - I knew about it for more than a \n week before it happened',
                            style: TextStyle(
                                fontSize: 16
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
                                MaterialPageRoute(builder: (context) => Questionnaire16(
                                    id: widget.id)
                                )
                            );
                            await FirebaseFirestore.instance
                                .collection('questionnaire')
                                .doc(widget.id)
                                .set({'15. Did you know the event/experience was going to occur before it happened?': text},
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
                  percent: 15/16,
                  center: const Text('15/16'),
                  barRadius: const Radius.circular(30),
                  backgroundColor: const Color(0xFFDCDCDC),
                  progressColor: const Color(0xFF32BEC4)
              )
          )
        )
    );
  }
}
