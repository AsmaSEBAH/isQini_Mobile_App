//import 'package:wateringapp/textfieldGeneral.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Meteo extends StatefulWidget {
  const Meteo({Key? key}) : super(key: key);
  _MeteoState createState() => _MeteoState();
}

class _MeteoState extends State<Meteo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("meteo"),
    );
  }
}
