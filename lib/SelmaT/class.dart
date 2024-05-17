import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Plante {
  double humidity = 0;
  double humiditySoil = 0;
  double temperature = 0;

  final DocumentReference _doc = FirebaseFirestore.instance.collection('User').doc('t6RRpO6ySf7MGV3MnakO').collection('Plante').doc('plante 1');
  void lireValue() {
    _doc.get().then((datasnapshot) {
      humidity = datasnapshot["Humidity"];
      temperature = datasnapshot["Temperature"];
      humiditySoil = datasnapshot["HumiditySoil"];
    });
    print(humidity);
    print(humiditySoil);
    print(temperature);
  }

  void arroser() {
    _doc.update({
      'Arroser': true
    }).then((_) {
      print("Led is ON!");
    });
  }

  void setDateHeure() {
    DocumentReference _doc1 = FirebaseFirestore.instance.collection("User").doc("t6RRpO6ySf7MGV3MnakO").collection('Mode').doc('Programme');
    DateTime datetime = DateTime.now();
    print(datetime.toString());
    _doc1.update({
      'Date': datetime
    }).then((_) {
      print("Date mise!");
    });
  }
}

class Mode {
  bool _programme = false;
  bool _auto = false;
  bool _manuel = true;
  final firestoreInstance = FirebaseFirestore.instance;

  void manuel() {
    _programme = false;
    _auto = false;
    _manuel = true;

    firestoreInstance.collection("User").doc("t6RRpO6ySf7MGV3MnakO").collection('Mode').doc('Manuel').update({
      "statu": true
    }).then((_) {
      print("success!");
    });
    firestoreInstance.collection("User").doc("t6RRpO6ySf7MGV3MnakO").collection('Mode').doc('Auto').update({
      "statu": false
    }).then((_) {
      print("success!");
    });
    firestoreInstance.collection("User").doc("t6RRpO6ySf7MGV3MnakO").collection('Mode').doc('Programme').update({
      "statu": false
    }).then((_) {
      print("success!");
    });
  }

  void automatic() {
    _programme = false;
    _auto = true;
    _manuel = false;
    firestoreInstance.collection("User").doc("t6RRpO6ySf7MGV3MnakO").collection('Mode').doc('Manuel').update({
      "statu": false
    }).then((_) {
      print("success!");
    });
    firestoreInstance.collection("User").doc("t6RRpO6ySf7MGV3MnakO").collection('Mode').doc('Auto').update({
      "statu": true
    }).then((_) {
      print("success!");
    });
    firestoreInstance.collection("User").doc("t6RRpO6ySf7MGV3MnakO").collection('Mode').doc('Programme').update({
      "statu": false
    }).then((_) {
      print("success!");
    });
  }

  void programme() {
    _programme = true;
    _auto = false;
    _manuel = false;
    firestoreInstance.collection("User").doc("t6RRpO6ySf7MGV3MnakO").collection('Mode').doc('Manuel').update({
      "statu": false
    }).then((_) {
      print("success!");
    });
    firestoreInstance.collection("User").doc("t6RRpO6ySf7MGV3MnakO").collection('Mode').doc('Auto').update({
      "statu": false
    }).then((_) {
      print("success!");
    });
    firestoreInstance.collection("User").doc("t6RRpO6ySf7MGV3MnakO").collection('Mode').doc('Programme').update({
      "statu": true
    }).then((_) {
      print("success!");
    });
  }
}

class Citerne {
  double quantitEau = 0;
  DocumentReference _doc = FirebaseFirestore.instance.collection('User').doc('t6RRpO6ySf7MGV3MnakO').collection('citerne').doc('1');
  void getQEau() {
    _doc.get().then((datasnapshot) {
      quantitEau = datasnapshot["eau"];
    });
    print(quantitEau);
  }
}
