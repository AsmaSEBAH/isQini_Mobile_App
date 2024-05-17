import 'package:flutter/material.dart';
import 'dart:async';
import 'MultipleNotifier.dart';
import 'data.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Hor_loge extends StatefulWidget {
  const Hor_loge({Key? key}) : super(key: key);
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Hor_loge> {
  TimeOfDay _time = TimeOfDay.now();
  DateTime time = DateTime.now();
  String jourArrosage = '';

  @override
  void initState() {
    super.initState();

    _InitTime();
    _InitDay();
    setState(() {});
  }

  Future<void> _InitTime() async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    final DocumentReference _doc = FirebaseFirestore.instance.collection('Users').doc(_auth.currentUser!.uid).collection('Mode').doc('Modes');
    await _doc.get().then((datasnapshot) {
      setState(() {
        time = (datasnapshot["Temps"]).toDate();
        _time = TimeOfDay.fromDateTime(time);
      });
    });
  }

  Future<void> _InitDay() async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    final DocumentReference _doc = FirebaseFirestore.instance.collection('Users').doc(_auth.currentUser!.uid).collection('Mode').doc('Modes');
    await _doc.get().then((datasnapshot) {
      setState(() {
        jourArrosage = datasnapshot["Jour"];
      });
    });
  }

  Future<void> _UpdateVlue() async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    final DocumentReference _doc = FirebaseFirestore.instance.collection('Users').doc(_auth.currentUser!.uid).collection('Mode').doc('Modes');
    await _doc.get().then((datasnapshot) {
      jourArrosage = datasnapshot["Jour"];
    });
  }

  _showTime(BuildContext context) => showDialog(
      barrierColor: Color(0x251300FF),
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("L'heure d'arrosage"),
          content: Container(
            child: ListTile(
              leading: Icon(Icons.access_time),
              title: Text(_time.format(context)),
            ),
          ),
          actions: [
            TextButton(
              child: Text('OK'),
              style: TextButton.styleFrom(
                primary: Color(0xFF2AF598),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      });

  _showDay(BuildContext context) => showDialog(
      barrierColor: Color(0x251300FF),
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Le jour d'arrosage est :"),
          content: Container(
            child: ListTile(
              leading: Icon(Icons.access_time),
              title: Text(jourArrosage),
            ),
          ),
          actions: [
            TextButton(
              child: Text('OK'),
              style: TextButton.styleFrom(
                primary: Color(0xFF2AF598),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      });

  _showSingleChoiceDialog(BuildContext context) => showDialog(
        context: context,
        builder: (context) {
          final _singleNotifier = Provider.of<SingleNotifier>(context);
          return AlertDialog(
            title: Text('Selectionner un jour'),
            content: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: days
                      .map((e) => RadioListTile(
                            title: Text(e),
                            value: e,
                            groupValue: _singleNotifier.currentDay,
                            selected: _singleNotifier.currentDay == e,
                            onChanged: (value) {
                              jourArrosage = e;
                              _singleNotifier.updateDay(e);
                            },
                          ))
                      .toList(),
                ),
              ),
            ),
            actions: [
              TextButton(
                child: Text('CANCEL'),
                style: TextButton.styleFrom(
                  primary: Color(0xFF2AF598),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('OK'),
                style: TextButton.styleFrom(
                  primary: Color(0xFF2AF598),
                ),
                onPressed: () {
                  FirebaseAuth _auth = FirebaseAuth.instance;
                  final DocumentReference _doc = FirebaseFirestore.instance.collection('Users').doc(_auth.currentUser!.uid).collection('Mode').doc('Modes');
                  Navigator.of(context).pop();
                  _doc.update({
                    "Jour": _singleNotifier.currentDay
                  }).then((_) {
                    print("ok");
                  });
                },
              ),
            ],
          );
        },
      );

  void _firebaseT(TimeOfDay t) {
    final now = new DateTime.now();
    DateTime val = DateTime(now.year, now.month, now.day, t.hour, t.minute);
    Timestamp myTimeStamp = Timestamp.fromDate(val);
    FirebaseAuth _auth = FirebaseAuth.instance;
    final DocumentReference _doc = FirebaseFirestore.instance.collection('Users').doc(_auth.currentUser!.uid).collection('Mode').doc('Modes');
    _doc.update({
      "Temps": myTimeStamp
    }).then((_) {});
  }

  _pickTime() async {
    showTimePicker(
      context: context,
      initialTime: _time,
      builder: (context, child) => Theme(
        data: ThemeData().copyWith(
          colorScheme: ColorScheme.light(
            primary: Color(0xFF2AF598),
            onSurface: Colors.brown,
          ),
        ),
        child: child!,
      ),
    ).then((_value) {
      setState(() {
        _time = _value!;
        _firebaseT(_time);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff2AF598),
          iconTheme: IconThemeData(color: Colors.black),
          title: ListTile(
            minLeadingWidth: 10,
            leading: Icon(Icons.access_time, color: Colors.black, size: 20),
            title: Text(
              'Horloge',
              style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
            child: Column(
          children: <Widget>[
            Image.asset('assets/images/Horloge.jpg'),
            ListTile(
              leading: Icon(Icons.access_time),
              title: Text("L'heure d'arrosage"),
              trailing: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  setState(() {
                    _pickTime();
                  });
                },
              ),
              onTap: () {
                _showTime(context);
              },
            ),
            ListTile(
              onTap: () {
                _showDay(context);
              },
              leading: Icon(Icons.calendar_today),
              title: Text("Le jour d'arrosage"),
              trailing: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  _showSingleChoiceDialog(context);
                },
              ),
            ),
          ],
        )));
  }
}
