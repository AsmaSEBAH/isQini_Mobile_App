//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
//import 'package:flutter/painting.dart';
import 'package:helloworld/SelmaZ/allZ.dart';
import 'package:helloworld/yasmine/all.dart';
import 'package:helloworld/asma/all.dart';

/*import 'icons.dart';
import 'icons2.dart';
import 'home_net.dart';
import 'profil.dart';
import 'meteo.dart';
import 'navigationDrawerWidget.dart';*/


class Home_button1 extends StatefulWidget {
  const Home_button1({Key? key}) : super(key: key);
  _Home_button1State createState() => _Home_button1State();
}

class _Home_button1State extends State<Home_button1> {
  get green => null;
  int index = 1;

  final screens = [
    Meteo(),
    Home_net1(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(backgroundColor: Colors.transparent, iconTheme: IconThemeData(color: Colors.black), elevation: 0, actions: <Widget>[
        IconButton(
          icon: Icon(
            Myicons.wateringTool,
            color: Color(0xff000000),
            //size: 37,
          ),
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Mode1(),
          )),
        ),
      ]),
      bottomNavigationBar: CurvedNavigationBar(
        index: index,
        animationCurve: Curves.easeInOut, //n
        animationDuration: Duration(milliseconds: 30), //n
        backgroundColor: Colors.transparent,
        color: Color(0xff2AF598),
        height: 60,
        onTap: (index) => setState(() => this.index = index),
        items: <Widget>[
          Icon(Icons.add, size: 32),
          Icon(Icons.home_outlined, size: 32),
          Icon(Icons.perm_identity, size: 32),
        ],
      ),
      body: screens[index],
    );
  }

  /* Widget plantImage() => CircleAvatar(
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
                  children: <Widget>[
                    Text('temp'),
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Myicons2.humidity,
                  color: Color(0xff000000),
                  size: 40,
                ),
                SizedBox(height: 15),
                Row(
                  children: <Widget>[
                    Text('Humi'),
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
          const SizedBox(width: 15),
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
                  children: <Widget>[
                    Text('50'),
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
          ),
        ],
      );
*/
}
