import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rewardprocessing/questionnaire/consent.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProlificID extends StatefulWidget {
  const ProlificID({super.key});

  @override
  State<ProlificID> createState() => _ProlificIDState();
}

class _ProlificIDState extends State<ProlificID> {
  bool activeButton = false;
  final formKey = GlobalKey<FormState>();
  late String prolificID;
  final TextEditingController _textEditingController = TextEditingController();
  Color counterTextColor = Colors.black;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3))
        .then((value) => {FlutterNativeSplash.remove()});

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                  child: Container(
                      margin: const EdgeInsets.only(bottom: 60, left: 60, right: 60),
                      width: 380,
                      height: 90,
                      decoration: const BoxDecoration(
                          color: Color(0xFFFFD9A0),
                          borderRadius: BorderRadius.all(Radius.circular(30)
                          )
                      ),
                      alignment: Alignment.center,
                      child: Container(
                          margin: const EdgeInsets.only(left: 10, right: 10),
                          child: const Text('Please enter your prolific ID:',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16)
                          )
                      )
                  )
              ),
              Container(
                  padding: const EdgeInsets.only(left: 60, right: 60),
                  child: Form(
                      key: formKey,
                      child: TextFormField(
                          maxLines: 1,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp('[A-Za-z0-9]')),
                          ],
                          validator: (val) {
                            return (RegExp("[A-Za-z0-9]").hasMatch(prolificID) &&
                                prolificID.length <= 15) 
                                ? null
                                 : "Request body length over limit";
                          },
                          cursorColor: const Color(0xFF00A8AF),
                          decoration: const InputDecoration(
                              hintText: 'Enter here',
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                      width: 2,
                                      color: Colors.grey,
                                      style: BorderStyle.solid)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                      width: 2,
                                      color: Color(0xFF00A8AF),
                                      style: BorderStyle.solid
                                  )
                              )
                          ),
                          onChanged: (value) {
                            setState(() {
                              prolificID = value;
                              activeButton = value.isNotEmpty ? true : false;
                              _textEditingController.text = value;

                              if(value.length >15){
                                counterTextColor =Colors.red;
                              }else {
                                counterTextColor = Colors.black;
                              }
                            });
                          })
                  )
              ),
              Container(
                        margin: const EdgeInsets.only(right: 60),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '${_textEditingController.text.trim().length}/15',
                              style: TextStyle(color: counterTextColor),)
                          ],
                        ),
                      ),
              Container(
                  margin: const EdgeInsets.only(top: 60),
                  child: ElevatedButton(
                      onPressed: activeButton ? () async {
                        if (formKey.currentState!.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Consent(id: prolificID)
                              )
                          );
                        }
                        await FirebaseFirestore.instance
                            .collection('questionnaire')
                            .doc(prolificID)
                            .set({'Prolific ID': prolificID});
                      } : null,
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(160, 60),
                          backgroundColor: const Color(0xFF00A8AF),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100)
                          ),
                          elevation: 2.0),
                      child: const Text('Continue',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w300)
                      )
                  )
              )
            ]
        )
    );
  }
}