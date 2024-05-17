//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/painting.dart';
import 'okAutomatique.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AutomatiqueBut extends StatelessWidget {
  const AutomatiqueBut({Key? key}) : super(key: key);
  void auto() {
    FirebaseAuth _auth = FirebaseAuth.instance;
    final DocumentReference _doc = FirebaseFirestore.instance.collection('Users').doc(_auth.currentUser!.uid).collection('Mode').doc('Modes');
    _doc.update({
      "Manuel": false
    }).then((_) {});

    _doc.update({
      "Automatique": true
    }).then((_) {});

    _doc.update({
      "Programme": false
    }).then((_) {});
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
        //padding: EdgeInsets.all(16.0),
        //padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        width: 149,
        //width: 50,
        height: 165,
        child: Material(
          elevation: 8,
          color: Color(0xFFF2EDE6),
          borderRadius: BorderRadius.circular(10),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: InkWell(
            splashColor: Colors.black26,
            onTap: () {
              auto();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const OkAutomatique(),
                ),
              );
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Ink.image(
                  image: AssetImage('assets/images/automatique.png'),
                  height: 125.44,
                  width: 97.39,
                  fit: BoxFit.cover,
                ),
                // SizedBox(height: 6),
                Text(
                  'Automatique',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
