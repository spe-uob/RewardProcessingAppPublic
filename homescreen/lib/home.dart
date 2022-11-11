import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

String content = 'By clicking the "Yes, I consent" button below, you agree to the following: \n\n'
    '1.	I have received information about the tasks involved in this research study and been given the opportunity to ask questions\n\n'
    '2.	I have received enough information about the study to make an informed decision to participate, and I understand my participation is completely voluntary.\n\n'
    '3.	I understand that after the study the data will be made "open data". I understand that this means the anonymised data will be publicly available and may be used for purposes not related to this study, and it will not be possible to identify me from these data.\n\n'
    '4.	I am aware I am free to withdraw from the study at any time without giving a reason for doing so.\n';

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(30),
              child:
              Text(content, textAlign: TextAlign.justify,
                style: const TextStyle(fontSize: 15,
                  fontStyle: FontStyle.normal,
                  height: 1.75,
                  letterSpacing: 1,
                ),
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 70),
                      child:
                      ElevatedButton(onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(160, 60),
                            primary: Colors.white70,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100)),
                            elevation: 2.0,
                          ),
                          child: const Text(
                              'No, I do not consent.',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.teal,
                                fontSize: 16,
                              )
                          )
                      )
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10, right: 10, bottom: 70),
                      child:
                      ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(160, 60),
                            primary: Colors.teal,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100)),
                            elevation: 2.0,),
                          child: const Text(
                            'Yes, I consent.',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white,
                              fontSize: 16,
                            ),
                          )
                      ),
                  )
                ]
            )
          ]
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
          fontWeight: FontWeight.w500,
          color: Colors.white,
          fontSize: 26,
        ),
      ),
      elevation: 0.0,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          color: Colors.teal,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(35),
              bottomRight: Radius.circular(35)
          ),
        ),
      ),
    );
  }
}


