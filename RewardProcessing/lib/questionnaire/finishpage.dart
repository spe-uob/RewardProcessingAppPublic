import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';

class FinishPage extends StatefulWidget {
  final String id;
  const FinishPage({super.key, required this.id});

  @override
  State<FinishPage> createState() => _FinishPageState();
}

class _FinishPageState extends State<FinishPage> {
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
                  Image.asset('assets/images/UoB_logo2.png',
                    width: 300,
                  ),
                  Container(
                    margin: const EdgeInsets.only(right:50,left:50,top:55,bottom:20),
                    child: const Text("THANK YOU FOR COMPLETING TODAY'S STUDY",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.black
                      ),
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(right: 50, left: 50, top: 52, bottom: 20),
                      child: const Text('',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 17,
                              color: Colors.black
                          )
                      )
                  ),
                  Container(
                      margin: const EdgeInsets.only(right :50, left: 50, top: 30, bottom: 30),
                      child: const Text("Please click the button below to end the experiment and exit ",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20,
                              color: Colors.black
                          )
                      )
                  ),
                  Container(
                      margin: const EdgeInsets.only(left: 10, right: 10, top: 30),
                      child:
                      ElevatedButton(
                          onPressed: () {
                            //SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop');
                            exit(0);
                            },
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(160, 60),
                            backgroundColor: const Color(0xFF00A8AF),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100)
                            ),
                            elevation: 2.0,),
                          child: const Text(
                              'Exit',
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
