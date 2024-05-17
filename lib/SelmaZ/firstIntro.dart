import 'package:flutter/material.dart';
import 'original_button1.dart';
import 'Intro.dart';

//creation de la 1 page qui permet de choisir la langue
class FirstIntro extends StatelessWidget {
  const FirstIntro({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
              const Text(
                'Veuillez choisir une langue',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 120,
              ),
              //permet d'acceder a toutes les pages de Français
              OriginalButton1(
                text: 'Français',
                onpressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => IntroScreen()));
                },
                textColor: Colors.black,
                bgColor: Color(0xff2AF598),
              ),
              const SizedBox(
                height: 30,
              ),
              //permet d'acceder a toutes les pages d'Arbe
              OriginalButton1(
                text: 'Arabe',
                onpressed: () {
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => IntroScreenA()));
                },
                textColor: Colors.black,
                bgColor: Color(0xff2AF598),
              ),
            ]),
          ),
        ));
  }
}
