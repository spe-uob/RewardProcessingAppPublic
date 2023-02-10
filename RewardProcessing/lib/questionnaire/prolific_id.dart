import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rewardprocessing/questionnaire/consent.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class ProlificID extends StatefulWidget {
  const ProlificID ({super.key});

  @override
  State<ProlificID> createState() => _ProlificIDState();
}

class _ProlificIDState extends State<ProlificID> {
  bool activeButton = false;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3)).then((value) => {
      FlutterNativeSplash.remove()
    });

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
                      margin: const EdgeInsets.only(bottom:60, left:60, right:60),
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
                              'Please enter your prolific ID:',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 17)
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
                          inputFormatters:[
                            FilteringTextInputFormatter.allow(RegExp('[A-Za-z0-9]')),
                            // LengthLimitingTextInputFormatter(7)
                          ],
                          validator: (val){
                            return (
                                RegExp("[A-Za-z0-9]").hasMatch(val!)
                                    && val.length <= 15
                            )? null: "Request body length over limit";
                          },
                          cursorColor: const Color(0xFF00A8AF),
                          decoration: const InputDecoration(
                              hintText: 'Enter here',
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                      width: 2,
                                      color: Colors.grey,
                                      style: BorderStyle.solid
                                  )
                              ),
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
                              activeButton = value.isNotEmpty ? true : false;
                            });
                          }
                      )
                  )
              ),
              Container(
                  margin: const EdgeInsets.only(top: 60),
                  child: ElevatedButton(
                      onPressed: activeButton ? () {
                        if(formKey.currentState!.validate()){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const Consent())
                          );
                        }
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
    );
  }
}
