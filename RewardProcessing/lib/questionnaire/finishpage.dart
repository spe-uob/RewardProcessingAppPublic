import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:url_launcher/url_launcher.dart';

class FinishPage extends StatefulWidget {
  final String id;
  final String day;
  const FinishPage({super.key, required this.id, required this.day});

  @override
  State<FinishPage> createState() => _FinishPageState();
}

class _FinishPageState extends State<FinishPage> {
  static final _url = Uri.parse('https://www.samaritans.org');


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
                  Image.asset(
                    'assets/images/UoB_logo2.png',
                    width: 300,
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 50, left: 50, top: 50, bottom: 20),
                    child: const Text("THANK YOU FOR COMPLETING TODAY'S STUDY",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 23,
                          color: Colors.black
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 35, left: 35, top: 20, bottom: 20),
                    child: Text.rich(
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                        height: 1.3,
                        letterSpacing: 0.75
                      ),
                      TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Please note: If you experience any adverse effects to your mental health, please seek help from your usual care providers. If you require immediate help, online advice can be found at ',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                          TextSpan(
                            text: 'www.samaritans.org',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                launchUrl(_url);
                              },
                          ),
                          const TextSpan(
                            text:
                            '; or alternatively, free of charge, you can contact a Samaritan on 116 123 (available 24 hours a day, 365 days a year).',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          )
                        ]
                      )
                    )
                  ),
                  Container(
                      margin: const EdgeInsets.only(left: 10, right: 10, top: 30),
                      child: ElevatedButton(
                          onPressed: () {
                            if (Platform.isAndroid) {
                              SystemNavigator.pop();
                            } else {
                              exit(0);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(160, 60),
                            backgroundColor: const Color(0xFF00A8AF),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100)
                            ),
                            elevation: 2.0,),
                          child: const Text(
                              'Complete',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white,
                                  fontSize: 18,
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