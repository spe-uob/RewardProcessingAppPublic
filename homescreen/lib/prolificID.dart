import 'dart:ui';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:homescreen/home.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
// import 'package:percent_indicator/percent_indicator.dart';

class ProlificID extends StatefulWidget {
  const ProlificID ({super.key});

  @override
  State<ProlificID> createState() => _ProlificIDState();
}

class _ProlificIDState extends State<ProlificID> {
  bool activeButton = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3)).then((value) => {
      FlutterNativeSplash.remove()
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: ()async {
          return false; // disable back page
        },
        child: Scaffold(
            body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                      child: Container(
                          margin: const EdgeInsets.only(bottom:50, left:60, right:60),
                          width: 380,
                          height: 60,
                          decoration: const BoxDecoration(
                              color: Color(0xFFFFD9A0),
                              borderRadius: BorderRadius.all(Radius.circular(30))
                          ),
                          alignment: Alignment.center,
                          child: Container (
                              margin: const EdgeInsets.only(left: 10, right: 10),
                              child: const Text (
                                  'Please enter your prolific ID here:',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 17,
                                      height: 1.45
                                  )
                              )
                          )
                      )
                  ),
                  Container(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      child: TextField(
                          maxLines: 1,
                          cursorColor: const Color(0xFF00A8AF),
                          decoration: const InputDecoration(
                              hintText: 'Prolific ID',
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                  borderSide: BorderSide(
                                      width: 2,
                                      color: Colors.grey,
                                      style: BorderStyle.solid
                                  )
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                  borderSide: BorderSide(
                                      width: 2,
                                      color: Color(0xFF00A8AF),
                                      style: BorderStyle.solid
                                  )
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
                      margin: const EdgeInsets.only(top: 50),
                      child: ElevatedButton(
                          onPressed: activeButton ? () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const Home())
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
        )
    );
  }
}