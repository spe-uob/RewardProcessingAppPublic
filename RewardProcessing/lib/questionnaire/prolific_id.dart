import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rewardprocessing/questionnaire/consent.dart';
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

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  Future<void> checkValidation(String id) async {
    var user = await FirebaseFirestore.instance
        .collection('questionnaire')
        .doc(id)
        .get();
    if (user.exists) { // if the ID exists
      Map<String, dynamic>? map = user.data();
      if (map != null && map.isNotEmpty) { // if document exists and data exists inside, it's invalid
        if (mounted) {
          popup(context);
        }
      } else if (map != null && map.isEmpty) { // if the document exists and has no data inside, it's valid
        if (mounted) {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>
                  Consent(id: prolificID)
              )
          );
          await FirebaseFirestore.instance
              .collection('questionnaire')
              .doc(prolificID)
              .set({'00. Prolific ID': prolificID});
        }
      }
    } else { // if the document does not exist, it's invalid
      if (mounted) {
        popup(context);
      }
    }
  }

  // a message pops up if the ID is invalid
  void popup(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            content: const Text(
              'The prolific ID already exists. Please enter a valid ID.',
              textAlign: TextAlign.center,
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
            ),
            insetPadding: const EdgeInsets.only(right: 50, left: 50),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(90, 45),
                            backgroundColor: const Color(0xFF00A8AF),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100)
                            ),
                            elevation: 2.0,
                          ),
                          child: const Text(
                              'OK',
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
          );
        }
    );
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
                  SizedBox(
                      child: Container(
                          margin: const EdgeInsets.only(bottom: 60, left: 60, right: 60),
                          width: 380,
                          height: 90,
                          decoration: const BoxDecoration(
                              color: Color(0xFFFFD9A0),
                              borderRadius: BorderRadius.all(Radius.circular(30))
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
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.done,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp('[A-Za-z0-9]')
                                )
                              ],
                              validator: (val) {
                                return (RegExp("[A-Za-z0-9]").hasMatch(
                                    prolificID) &&
                                    prolificID.length <= 30)
                                    ? null
                                    : "Request body length over limit";
                              },
                              cursorColor: const Color(0xFF00A8AF),
                              decoration: const InputDecoration(
                                  hintText: 'Enter here',
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)
                                      ),
                                      borderSide: BorderSide(
                                          width: 2,
                                          color: Colors.grey,
                                          style: BorderStyle.solid
                                      )
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)
                                      ),
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

                                  if (value.length > 30) {
                                    counterTextColor = Colors.red;
                                  } else {
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
                          '${_textEditingController.text
                              .trim()
                              .length}/30',
                          style: TextStyle(
                              color: counterTextColor
                          )
                        )
                      ]
                    )
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 60),
                      child: ElevatedButton(
                          onPressed: activeButton ? () async {
                            checkValidation(prolificID);
                            if (formKey.currentState!.validate()) {
                            }
                          } : null,
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
    );
  }
}