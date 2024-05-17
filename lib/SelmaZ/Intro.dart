import 'package:flutter/material.dart';
import 'original_button.dart';
import 'login.dart';
import 'Appbar.dart';

//creation de la 2 page qui permet l'utilisateur de commencer
class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar(context),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
              SizedBox(),
              //insertion d'une image
              Image.asset('assets/images/pctr.png'),
              //bouton qui permet d'acceder a la page de connexion
              OriginalButton(
                text: 'Commencer',
                onpressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                },
                textColor: Colors.black,
                bgColor: Color(0xff2AF598),
              ),
            ]),
          ),
        ));
  }
}
