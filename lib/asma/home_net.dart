//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/painting.dart';
//import 'icons.dart';
import 'icons2.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Home_net extends StatefulWidget {
  Home_net() {}

  _Home_netState createState() => _Home_netState();
}

class _Home_netState extends State<Home_net> {
  double temperature = 0, humidity = 0;
  //humiditySoil = 0,

  final bool _running = true;
  @override
  initState() {
    super.initState();
    initValue();

    updatValue();
  }

  Future<void> initValue() async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    final DocumentReference _doc = FirebaseFirestore.instance.collection('Users').doc(_auth.currentUser!.uid).collection('Plante').doc('Plante 1');
    await _doc.get().then((datasnapshot) {
      setState(() {
        if (datasnapshot["Humidite"] != null) humidity = datasnapshot["Humidite"].toDouble();
        if (datasnapshot['Temperature'] != null) temperature = datasnapshot["Temperature"].toDouble();
        //if (datasnapshot['HumiditeSol'] != null) humiditySoil = datasnapshot["HumiditeSol"].toDouble();
      });
    });
  }

  Future<void> updatValue() async {
    Timer? timer;
    FirebaseAuth _auth = FirebaseAuth.instance;
    final DocumentReference _doc = FirebaseFirestore.instance.collection('Users').doc(_auth.currentUser!.uid).collection('Plante').doc('Plante 1');
    timer = Timer.periodic(Duration(seconds: 3), (_) {
      setState(() {
        _doc.get().then((datasnapshot) {
          if (datasnapshot["Humidite"] != null) humidity = datasnapshot["Humidite"].toDouble();
          if (datasnapshot['Temperature'] != null) temperature = datasnapshot["Temperature"].toDouble();
          //if (datasnapshot['HumiditeSol'] != null) humiditySoil = datasnapshot["HumiditeSol"].toDouble();
        });
      });
    });
  }

  GlobalKey<ScaffoldState> _key = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 50,
              child: plantImage(),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.40,
              child: donnee(),
            ),
          ],
        ),
      ),
    );
  }

  Widget plantImage() => CircleAvatar(
        radius: 80,
        backgroundColor: Colors.grey,
        backgroundImage: NetworkImage('https://png.pngtree.com/png-clipart/20190516/original/pngtree-cartoon-hand-drawn-potted-plants-illustration-hand-drawnplantpotted-plantgreen-png-image_4073654.jpg'),
      );

  Widget donnee() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Myicons2.thermometer,
                  color: Color(0xff000000),
                  size: 40,
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('$temperature'),
                    Text(
                      '°C',
                      style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            width: MediaQuery.of(context).size.width * 0.27,
            height: 145,
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              color: Color(0xfffffa78),

              //boxShadow: [
              //BoxShadow(spreadRadius: 0, offset: Offset(0, 10), blurRadius: 0, color: green.withOpacity(0.4))
              // ],
            ),
          ),
          const SizedBox(width: 15),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Myicons2.humidity,
                  color: Color(0xff000000),
                  size: 40,
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('$humidity'),
                    Text(
                      '%',
                      style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            width: MediaQuery.of(context).size.width * 0.27,
            height: 145,
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              color: Color(0xffF2EDE6),

              //boxShadow: [
              //BoxShadow(spreadRadius: 0, offset: Offset(0, 10), blurRadius: 0, color: green.withOpacity(0.4))
              // ],
            ),
          ),
          /*const SizedBox(width: 15),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Myicons2.water_level,
                  color: Color(0xff000000),
                  size: 40,
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('$humiditySoil'),
                    Text(
                      'L',
                      style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            width: MediaQuery.of(context).size.width * 0.27,
            height: 145,
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              color: Color(0xff00ecff),

              //boxShadow: [
              //BoxShadow(spreadRadius: 0, offset: Offset(0, 10), blurRadius: 0, color: green.withOpacity(0.4))
              // ],
            ),
          ),*/
        ],
      );
}
