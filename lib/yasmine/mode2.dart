import 'package:flutter/material.dart';
/*import 'package:flutter/painting.dart';
import 'package:flutter/cupertino.dart';
import 'ManuelBut.dart';
import 'automatiqueBut.dart';*/
import 'demarrerBut.dart';
import 'programmeBut.dart';

//import 'package:curved_navigation_bar/curved_navigation_bar.dart';

//import 'navigationDrawerWidget.dart';
//import 'icons.dart';

class Mode2 extends StatelessWidget {
  const Mode2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Color(0xff2AF598), iconTheme: IconThemeData(color: Colors.black), actions: <Widget>[
          /* IconButton(
            icon: Icon(
              Icons.add,
              color: Color(0xff000000),
            ),
            onPressed: () {
              print('Go to the watering mode');
            },
          ),*/
        ]),
        //drawer: NavigationDrawerWidget(),
        /*appBar: AppBar(backgroundColor: Color(0xff2AF598), iconTheme: IconThemeData(color: Colors.black), actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              color: Color(0xff000000),
            ),
            onPressed: () {
              print('Go to the watering mode');
            },
          ),
        ]),*/
        body: Center(
            child: Column(children: <Widget>[
          SizedBox(
            height: 80,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            alignment: Alignment.center,
            child: Text(
              "Veuillez choisir quel mode manuel",
              style: TextStyle(fontSize: 20, color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 80,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Container(
              //alignment: Arignment.center,
              child: DemarrerBut(),
              //margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
              padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
              //padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            ),
            const SizedBox(width: 15),
            Container(
              alignment: Alignment.center,
              child: ProgrammeBut(),
              //margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
              padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
              //padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            )
          ])
        ])));
  }
}
