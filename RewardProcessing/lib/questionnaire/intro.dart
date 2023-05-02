import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rewardprocessing/questionnaire/prolific_id.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  String content = 'Are you ready to test your emotions and decision-making skills?';

  String content1 =
      'Our app offers a unique combination of a questionnaire and '
      'a game for research purposes. First, you will answer 16 questions regarding your current moods. Next, you will play two levels of a '
      'PacMan-style game. Once you complete the game, you will be asked to answer two additional questions.\n\n';

  String content2 =
      'Research Description';

  String content3 =
      '\nOur mood greatly impacts our decision-making skills by influencing the type of information we attend to and also how we process it. '
      'With this in mind, it can be easy to see how an impairment to our decision-making strategies and learning of action-outcome pairings '
      'could lead to an array of dysfunctional behaviours. In particular, reward processing abnormalities (RPAs) are a notable concern for '
      'people experiencing mood disorders. According to research, individuals with depression tend to have negative responses to losses, '
      'leading them to make risky decisions. In contrast, those with anxiety are likely to make less risky decisions as they need certainty '
      'of outcomes to gain the sense of security.\n\n'
      'A key issue with our current understanding of how mood affects our decision-making processes is that most of the research in '
      'this field has been conducted using artificial mood-manipulation strategies in controlled laboratory settings. '
      'As such, we cannot be certain that this reflects true naturally-occurring mood states, or that in real-world settings our '
      'decision strategies would be the same. Thus, the key aim of this research is to apply a novel methodological approach to the '
      'combined assessment of mood and decision making. We plan to use a gamified design to combine several different reward-learning tasks '
      'into one arcade style game, to be played following a brief mood state assessment, all within a mobile app. If the novel approach is '
      'viable this technology could be used; as a prodromal biomarker; as an assessment tool to understand the current state of RPAs; for the '
      'evaluation of treatment response by measuring for improvement in deficits; as an indicator for areas of targeted treatment, '
      'or; as an intervention training task itself, by training individuals to engage in functional reward processing strategies.';

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3))
        .then((value) => {FlutterNativeSplash.remove()}
    );

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
                              margin: const EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 20),
                              child: Text(
                                content,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                          ),
                          Container(
                              margin: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
                              child: RichText(
                                  textAlign: TextAlign.justify,
                                  text: TextSpan(
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontStyle: FontStyle.normal,
                                        color: Colors.black,
                                        height: 1.75,
                                        letterSpacing: 0.75,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(text: content1),
                                        TextSpan(
                                            text: content2,
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                decoration: TextDecoration.underline
                                            )
                                        ),
                                        TextSpan(text: content3),
                                      ]
                                  )
                              )
                          ),
                          Container(
                              margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 70),
                              child: ElevatedButton(
                                  onPressed:() {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const ProlificID()
                                        )
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: const Size(160, 60),
                                    backgroundColor: const Color(0xFF00A8AF),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(100)
                                    ),
                                    elevation: 2.0,
                                  ),
                                  child: const Text('Begin',
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
            )
        )
    );
  }

  AppBar buildAppBar() {
    return AppBar(
        toolbarHeight: 90,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text('Welcome!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.white,
              fontSize: 24,
            )
        ),
        elevation: 0,
        flexibleSpace: Container(
            decoration: const BoxDecoration(
                color: Color(0xFF00A8AF),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(35),
                    bottomRight: Radius.circular(35)
                )
            )
        )
    );
  }
}