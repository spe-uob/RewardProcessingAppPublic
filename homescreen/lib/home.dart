import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:homescreen/homepage.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

String content =
    'By clicking the "Yes, I consent" button below, you agree to the following: \n\n'
    '1.	I have received information about the tasks involved in this research study and been given the opportunity to ask questions\n\n'
    '2.	I have received enough information about the study to make an informed decision to participate, and I understand my participation is completely voluntary.\n\n'
    '3.	I understand that after the study the data will be made "open data". I understand that this means the anonymised data will be publicly available and may be used for purposes not related to this study, and it will not be possible to identify me from these data.\n\n'
    '4.	I am aware I am free to withdraw from the study at any time without giving a reason for doing so.\n';

class _HomeState extends State<Home> {

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3)).then((value) => {
      FlutterNativeSplash.remove()
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar(),
        body: RawScrollbar(
            thickness: 8,
            thumbVisibility: false,
            thumbColor: Colors.grey,
            radius: const Radius.circular(100),
            child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          margin: const EdgeInsets.all(30),
                          child:
                          Text(content, textAlign: TextAlign.justify,
                              style: const TextStyle(fontSize: 14,
                                fontStyle: FontStyle.normal,
                                height: 1.75,
                                letterSpacing: 0.75,
                              )
                          )
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                margin: const EdgeInsets.only(left: 10, right: 10, bottom: 70),
                                child:
                                ElevatedButton(onPressed: () {
                                  if(Platform.isAndroid) {
                                    SystemNavigator.pop();
                                  } else {
                                    exit(0);
                                  }
                                },
                                    style: ElevatedButton.styleFrom(
                                      fixedSize: const Size(160, 60),
                                      backgroundColor: Colors.white70,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(100)),
                                      elevation: 2.0,
                                    ),
                                    child: const Text(
                                        'No, I do not consent.',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: Colors.teal,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w300
                                        )
                                    )
                                )
                            ),
                            Container(
                                margin: const EdgeInsets.only(left: 10, right: 10, bottom: 70),
                                child:
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => const HomePage())
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      fixedSize: const Size(160, 60),
                                      backgroundColor: Colors.teal,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(100)),
                                      elevation: 2.0,),
                                    child: const Text(
                                        'Yes, I consent.',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w300
                                        )
                                    )
                                )
                            )
                          ]
                      )
                    ]
                )
            )
        )
    );
  }

  AppBar buildAppBar() {
    return AppBar(
        toolbarHeight: 90,
        backgroundColor: Colors.transparent,
        title: const Text(
            'Participant Consent Form',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.white,
              fontSize: 24,
            )
        ),
        elevation: 0.0,
        flexibleSpace: Container(
            decoration: const BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(35),
                    bottomRight: Radius.circular(35)
                )
            )
        )
    );
  }
}
