import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:rolling_switch/rolling_switch.dart';

class Setting_page extends StatefulWidget {
  const Setting_page({Key? key}) : super(key: key);
  _Setting_pageState createState() => _Setting_pageState();
}

class _Setting_pageState extends State<Setting_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff2AF598),
        iconTheme: IconThemeData(color: Colors.black),
        title: ListTile(
          minLeadingWidth: 10,
          leading: Icon(Icons.settings_outlined, color: Colors.black, size: 20),
          title: Text(
            'Paramètres',
            style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(24),
          children: [
            SizedBox(height: 80),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text('Paramètre du compte', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
              IconButton(
                icon: Icon(Icons.arrow_forward_ios, color: Colors.black),
                onPressed: () {},
              ),
            ]),
            SizedBox(height: 20),
            buildRow('langue', false),
            SizedBox(height: 20),
            buildRow('Notifications', true),
            SizedBox(height: 20),
            buildRow('Mode Sombre', true),
          ],
        ),
      ),
    );
  }

  Row buildRow(String title, bool isActive) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
        Transform.scale(
          scale: 0.7,
          child: CupertinoSwitch(
            trackColor: Colors.grey,
            activeColor: Color(0xff2AF598),
            value: isActive,
            onChanged: (value) {
              setState(() {
                isActive = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
