//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
//import 'package:flutter/painting.dart';
import 'icons.dart';
import 'icons2.dart';
import 'navigationDrawerWidget.dart';

class Home_button extends StatefulWidget {
  const Home_button({Key? key}) : super(key: key);
  _Home_buttonState createState() => _Home_buttonState();
}

class _Home_buttonState extends State<Home_button> {
  get green => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(backgroundColor: Color(0xff2AF598), iconTheme: IconThemeData(color: Colors.black), actions: <Widget>[
        IconButton(
          icon: Icon(
            Myicons.wateringTool,
            color: Color(0xff000000),
          ),
          onPressed: () {
            print('Go to the watering mode');
          },
        ),
      ]),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: Color(0xff2AF598),
        height: 60,
        items: <Widget>[
          Icon(Icons.add, size: 32),
          Icon(Icons.home_outlined, size: 32),
          Icon(Icons.perm_identity, size: 32),
        ],
      ),
      body: Stack(
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
          Positioned(
            top: MediaQuery.of(context).size.height * 0.67,
            child: Container(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(10.0),
                  elevation: 3,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
                  minimumSize: Size(200, 50),
                  textStyle: TextStyle(fontSize: 20),
                  primary: Color(0xff2AF598),
                  onPrimary: Colors.black,
                ),
                child: Text('Arrosez'),
                onPressed: () => print('ppppppppp'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget plantImage() => CircleAvatar(
        radius: 80,
        backgroundColor: Colors.grey,
        backgroundImage: NetworkImage('https://png.pngtree.com/png-clipart/20190516/original/pngtree-cartoon-hand-drawn-potted-plants-illustration-hand-drawnplantpotted-plantgreen-png-image_4073654.jpg'),
      );

  Widget donnee() => Row(
        //mainAxisAlignment: MainAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
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
            //padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
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
                    Text('Hum'),
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
            padding: EdgeInsets.symmetric(
              vertical: 30,
            ), //horizontal: 10
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
}
