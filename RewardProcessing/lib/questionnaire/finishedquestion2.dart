import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rewardprocessing/questionnaire/finishedquestion3.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FinishedQuestion2 extends StatefulWidget {
  final String id;
  const FinishedQuestion2({super.key, required this.id});

  @override
  State<FinishedQuestion2> createState() => _FinishedQuestion2State();
}

class _FinishedQuestion2State extends State<FinishedQuestion2> {
  bool activeButton = false;
  late String text;
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return false; // disable back page
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Center(
              child: SingleChildScrollView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                            child: Container(
                                margin: const EdgeInsets.only(
                                    bottom: 40, left: 30, right: 30),
                                width: 380,
                                height: 110,
                                decoration: const BoxDecoration(
                                    color: Color(0xFFFFD9A0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                                alignment: Alignment.center,
                                child: Container(
                                    margin: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: const Text(
                                        'Did you use a strategy while playing the game, and/or did you understand how to play to gain the most points?'
                                        '\nlf yes, please detail:',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 15, height: 1.45))))),
                        Container(
                            padding: const EdgeInsets.only(left: 25, right: 25),
                            child: TextFormField(
                                controller: _textEditingController,
                                maxLines: 7,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp('[A-Z a-z 0-9 ]')),
                                  LengthLimitingTextInputFormatter(1000)
                                ],
                                validator: (val) {
                                  return (RegExp('[A-Z a-z 0-9 ]')
                                              .hasMatch(val!) &&
                                          val.length <= 1000)
                                      ? null
                                      : 'Request body length over limit';
                                },
                                cursorColor: const Color(0xFF00A8AF),
                                decoration: const InputDecoration(
                                    hintText: 'Type your answer here',
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        borderSide: BorderSide(
                                            width: 2,
                                            color: Colors.grey,
                                            style: BorderStyle.solid)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        borderSide: BorderSide(
                                            width: 2,
                                            color: Color(0xFF00A8AF),
                                            style: BorderStyle.solid))),
                                onChanged: (value) {
                                  setState(() {
                                    activeButton =
                                        value.isNotEmpty ? true : false;
                                  });
                                })),
                        Container(
                            margin: const EdgeInsets.only(left: 30, right: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                   Text('${_textEditingController.text.trim().isEmpty ? 0 : _textEditingController.text.trim().split(' ').where((element) => element.isNotEmpty).length}/500')
                        
                              ],
                            )),
                        Container(
                            margin: const EdgeInsets.only(top: 40),
                            child: ElevatedButton(
                                onPressed: activeButton
                                    ? () async {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const FinishedQuestion3(
                                                      id: '',
                                                    )));
                                        await FirebaseFirestore.instance
                                            .collection('questionnaire')
                                            .doc(widget.id)
                                            .set({
                                          '16. A brief description of the event or experience':
                                              text
                                        }, SetOptions(merge: true));
                                      }
                                    : null,
                                style: ElevatedButton.styleFrom(
                                    fixedSize: const Size(160, 60),
                                    backgroundColor: const Color(0xFF00A8AF),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100)),
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
                      )
                      )
                      ),
            bottomSheet: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, bottom: 80),
                child: LinearPercentIndicator(
                    animateFromLastPercent: true,
                    lineHeight: 20,
                    animationDuration: 1000,
                    percent: 1/2,
                    center: const Text('1/2'),
                    barRadius: const Radius.circular(30),
                    backgroundColor: const Color(0xFFDCDCDC),
                    progressColor: const Color(0xFF32BEC4)
                )
            )          
        )
        );
  }
}
