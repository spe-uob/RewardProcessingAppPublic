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
    return Scaffold(
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
      backgroundColor: const Color.fromARGB(36, 205, 235, 235),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [ImageShow(), ButtomStart()],
      )),
    );
  }
}

class ImageShow extends StatelessWidget {
  const ImageShow({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/image001.png', width: 250)
      ],
    );
  }
}

class ButtomStart extends StatelessWidget {
  const ButtomStart({super.key});

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
            backgroundColor: Color.fromARGB(255, 242, 216, 51),
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
