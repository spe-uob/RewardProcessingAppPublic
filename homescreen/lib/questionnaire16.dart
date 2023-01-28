import 'package:flutter/material.dart';
import 'package:homescreen/complete.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Questionnaire16 extends StatefulWidget {
  const Questionnaire16({super.key});

  @override
  State<Questionnaire16> createState() => _Questionnaire16State();
}

class _Questionnaire16State extends State<Questionnaire16> {
  bool activeButton = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: ()async {
          return false; // disable back page
        },
        child: Scaffold(
          body: Column(
              children: <Widget>[
                SizedBox(
                  child: Container(
                      margin: const EdgeInsets.only(bottom: 60, left:30, right: 30, top: 200),
                      width: 380,
                      height: 110,
                      decoration: const BoxDecoration(
                          color: Color(0xFFFFD9A0),
                          borderRadius: BorderRadius.all(Radius.circular(30))
                      ),
                      alignment: Alignment.center,
                      child: Container (
                          margin: const EdgeInsets.only(left: 10, right: 10),
                          child: const Text (
                              'If you feel comfortable, please briefly describe the event or experience that significantly affected your mood:',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 17,
                                letterSpacing: 0.75,
                              )
                          )
                      )
                  )
                ),
                Container(
                    margin: EdgeInsets.zero,
                    width: 380,
                    height: 150,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30))
                    ),
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: TextField(
                        maxLines: 6,
                        decoration: const InputDecoration(
                            hintText: 'Input your feedback',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            )
                        ),
                        onChanged: (value) {
                          setState(() {
                            activeButton = value.isNotEmpty ? true : false;
                          });
                      }
                    )
                ),
                Container(
                    margin: const EdgeInsets.only(top: 60),
                    child:
                    ElevatedButton(
                        onPressed: activeButton ? () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const Complete())
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
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25, top: 110),
                  child: LinearPercentIndicator(
                      animation: true,
                      animateFromLastPercent: true,
                      lineHeight: 20.0,
                      animationDuration: 300,
                      percent: 1,
                      center: const Text('16/16'),
                      barRadius: const Radius.circular(30),
                      backgroundColor: const Color(0xFFDCDCDC),
                      progressColor: const Color(0xFF32BEC4)
                  )
                )
              ]
          )
        )
    );
  }
}