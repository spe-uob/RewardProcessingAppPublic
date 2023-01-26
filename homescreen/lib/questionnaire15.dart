import 'package:flutter/material.dart';
import 'package:homescreen/questionnaire16.dart';


class Questionnaire15 extends StatefulWidget {
  const Questionnaire15({super.key});

  @override
  State<Questionnaire15> createState() => _Questionnaire15State();
}

class _Questionnaire15State extends State<Questionnaire15> {
  int? _value = 0;
  bool activeButton = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return false; // disable back page
        },
        child: Scaffold(
            body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                                  'In the last 24 hours, has an event or experience significantly affected your mood?',
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
                            value: 1,
                            groupValue: _value,
                            activeColor: const Color(0xFF00A8AF),
                            onChanged: (value){
                              setState(() {
                                _value = value;
                                activeButton = true;
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
                            value: 1,
                            groupValue: _value,
                            activeColor: const Color(0xFF00A8AF),
                            onChanged: (value){
                              setState(() {
                                _value = value;
                                activeButton = true;
                              });
                            }
                        ),
                        const Text('Yes - I knew about it for more than a week before it happened',
                            style: TextStyle(
                                fontSize: 16
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
                                MaterialPageRoute(builder: (context) => const Questionnaire16())
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
            )
        )
    );
  }
}