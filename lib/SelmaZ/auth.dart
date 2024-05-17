import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

//creations des classes contenant tous ce qui concerne l'authentification

class MyUser {
  final String uid;

  MyUser({required this.uid});
}

class AuthBase {
  MyUser? _userFromFirebase(User? user) {
    return user != null ? MyUser(uid: user.uid) : null;
  }

  Future registerWithEmailAndPassword(String nomUtilisateur, String email, String password) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final now = new DateTime.now();
    DateTime val = DateTime(now.year, now.month, now.day, now.hour, now.minute);
    Timestamp myTimeStamp = Timestamp.fromDate(val);

    final authResult = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);

    authResult.user!.updateDisplayName(nomUtilisateur);
    await _firestore.collection('Users').doc(_auth.currentUser!.uid).set({
      "nomUtilisateur": nomUtilisateur,
      "email": email,
      "mot de passe": password,
      "image": "Unavalible",
      "uid": _auth.currentUser!.uid,
    });
    await _firestore.collection('Users').doc(_auth.currentUser!.uid).collection('Mode').doc('Modes').set({
      "Arroser": false,
      "Jour": 'Dimanche',
      "Manuel": false,
      "Automatique": true,
      "Programme": false,
      "Temps": myTimeStamp,
    });
    await _firestore.collection('Users').doc(_auth.currentUser!.uid).collection('Plante').doc('Plante 1').set({
      "Humidite": 0,
      "HumiditeSol": 0,
      "Temperature": 0,
    });

    return authResult.user;
  }

  Future loginWithEmailAndPassword(String email, String password) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    FirebaseFirestore _firestore = FirebaseFirestore.instance;

    final authResult = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);

    _firestore.collection('Users').doc(_auth.currentUser!.uid).get().then((value) {
      if (value['username'] != null) authResult.user!.updateDisplayName(value['username']);
    });

    return authResult.user;
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<void> resetPassword(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  Future<void> changePassword(String nPassword) async {
    final _newpasswordController = TextEditingController();
    FirebaseAuth _auth = FirebaseAuth.instance;
    FirebaseFirestore _firestore = FirebaseFirestore.instance;

    User user = await FirebaseAuth.instance.currentUser!;
    user.updatePassword(nPassword).then((_) {
      _firestore.collection("Users").doc(_auth.currentUser!.uid).update({
        "mot de passe": nPassword,
      }).then((_) {
        print("Successfully changed password");
      });
    }).catchError((error) {
      print("Error " + error.toString());
    });
  }

  Future<void> changeUsername(String nomUtilisateur) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    FirebaseFirestore _firestore = FirebaseFirestore.instance;

    _firestore.collection("Users").doc(_auth.currentUser!.uid).update({
      "nomUtilisateur": nomUtilisateur,
    }).then((_) {
      print("Successfully changed password");
    });
  }

  Future<void> changeApropos(String apropos) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    FirebaseFirestore _firestore = FirebaseFirestore.instance;

    _firestore.collection("Users").doc(_auth.currentUser!.uid).update({
      "A propos": apropos,
    }).then((_) {
      print("Successfully changed password");
    });
  }
}
