import 'package:flutter/material.dart';
import 'package:homescreen/questionnaire11.dart';

class Questionnaire16 extends StatefulWidget {
  const Questionnaire16({super.key});

  @override
  State<Questionnaire16> createState() => _Questionnaire16State();
}

class _Questionnaire16State extends State<Questionnaire16> {
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
                          'If you feel comfortable, please briefly describe the event or experience that significantly affected your mood:',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 19,
                            letterSpacing: 0.75,
                          )
                      )
                  )
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 60, left:30, right: 30),
              width: 380,
              height: 85,
              decoration: const BoxDecoration(
                  // color: Color(0xFFEBCDB3),
                  borderRadius: BorderRadius.all(Radius.circular(30))
              ),
              padding: EdgeInsets.only(left: 30, right: 30, top: 5, bottom: 5),
              child: TextField(
                maxLines: 6,
              decoration: InputDecoration(
                hintText: "Input your feedback",
                // border: InputBorder.none

                border: OutlineInputBorder(

                 // borderRadius: BorderRadius.all(Radius.circular(30))
                ),
              ),
            ),),
            Container(
                margin: const EdgeInsets.only(left: 10, right: 10, top: 60),
                child:
                ElevatedButton(
                    onPressed:flag? () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Questionnaire11())
                      );
                    }:null,
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(160, 60),
                      backgroundColor: Color(0xFF00A8AF),
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
    )
    );
  }
}