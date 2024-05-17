//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Info_page extends StatelessWidget {
  const Info_page({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff2AF598),
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          title: ListTile(
            minLeadingWidth: 10,
            leading: Icon(Icons.people_outlined, color: Colors.black, size: 20),
            title: Text(
              'A propos de nous',
              style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          //centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 40),
              Container(
                child: Image.asset('assets/images/logo1.png'),
              ),
              SizedBox(height: 30),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      /*child: Text(
                        '"isQini" est une application qui réalise l' 'irrigation automatique de votre plants Réalizée par des etudiantes 2CP ESI Alger : ',
                        style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                      ),*/
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            TextSpan(text: '"isQini"', style: const TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: 'est une application qui réalise l' 'irrigation automatique de votre plants Réalizée par des etudiantes 2CP ESI Alger :'),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 40.0,
                      ),
                      child: Column(
                        children: [
                          Text(
                            'ks_taib@esi.dz ',
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                          Text(
                            'ka_sebah@esi.dz',
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                          Text(
                            'ks_benni@esi.dz',
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                          Text(
                            'ks_zerrouki@esi.dz',
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                          Text(
                            'ky_belmellat@esi.dz',
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                          Text(
                            'kh_ledra@esi.dz ',
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
