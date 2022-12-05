import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:homescreen/questionnaire.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return false; // disable back page
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text(
              'Pacman Reward',
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
            systemOverlayStyle: SystemUiOverlayStyle.dark,
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                label: 'home',
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                  label: 'account', icon: Icon(Icons.account_box))
            ],
          ),
          backgroundColor: Colors.white, // fromARGB(36, 205, 235, 235)
          body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [ImageShow(), ButtonStart()],
              )
          ),
        )
    );
  }
}

class ImageShow extends StatelessWidget {
  const ImageShow({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/pacman.png', width: 200)
      ],
    );
  }
}

class ButtonStart extends StatelessWidget {
  const ButtonStart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Questionnaire())
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF3565A4),
            fixedSize: const Size(180, 70),
            shape: const StadiumBorder(),
          ),
          child: const Text('Start'),
        )
      ],
    );
  }
}

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
