//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Aide extends StatelessWidget {
  const Aide({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff2AF598),
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          title: ListTile(
            minLeadingWidth: 10,
            leading: Icon(Icons.help_outlined, color: Colors.black, size: 20),
            title: Text(
              'Aide',
              style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          //centerTitle: true,
        ),
        body: Material(
          child: Center(
            child: Container(
              //color: Colors.blue,
              // height: MediaQuery.of(context).size.width * 0.7,
              height: 550,
              width: 316,
              //color: Colors.red,
              /* child: Stack(
            children: <Widget>[
              Positioned(
                top: 39.0,
                left: 20.0,*/
              child: Column(
                children: <Widget>[
                  Container(
                    height: 190,
                    width: 310,
                    //  color: Colors.red,
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            // height: MediaQuery.of(context).size.width * 0.5,
                            height: 200,
                            width: 299,
                            decoration: BoxDecoration(
                              color: Color(0xFFF2EDE6),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                        Positioned(
                          top: -10,
                          left: 10,
                          child: Image.asset('assets/images/automatique1.png'),
                        ),
                        Positioned(
                          top: 40,
                          left: 90,
                          child: Center(
                            child: Container(
                              alignment: Alignment.center,
                              child: Text('Mode automatique \n', textAlign: TextAlign.center, style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 70,
                          left: 30,
                          child: Center(
                            child: Container(
                              alignment: Alignment.center,
                              child: Text('Les plantes seront arrosées \n indépendamment du choix \n d’utilisateur. L’arrosage dépend au \n besoin de la plante (selon le seuil du \n température, humidité et humidité \n du sol ) \n', textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: Colors.black)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  /*  SizedBox(
                height: 40,
              ),*/

                  Container(
                    //  color: Colors.red,
                    height: 300,
                    width: 310,
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            // height: MediaQuery.of(context).size.width * 0.5,
                            height: 270,
                            width: 299,
                            decoration: BoxDecoration(
                              color: Color(0xFFF2EDE6),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: 10,
                          child: Image.asset('assets/images/manuel1.png'),
                        ),
                        Positioned(
                          top: 40,
                          left: 90,
                          child: Center(
                            child: Container(
                              alignment: Alignment.center,
                              child: Text('Mode Manuel \n', textAlign: TextAlign.center, style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),

                        Positioned(
                          top: 85,
                          left: 25,
                          child: Row(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Text('Démarrer \n', textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold)),
                                    Image.asset('assets/images/demarrer1.png'),
                                    Text('L’arrosage sera \n démarré \n directement \n', textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: Colors.black)),
                                  ],
                                ),
                              ),
                              /*SizedBox(
                                width: 0,
                              ),*/
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Text('Programmé \n', textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold)),
                                    Image.asset('assets/images/programme1.png'),
                                    Text('L’arrosage sera \n personnalisé \n (date, heure et \n répétition)', textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: Colors.black)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        //SizedBox()
                      ],
                    ),

                    /*Stack(
                      
                    ),*/
                  ),
                ],
              ),
              // ),
              // ],
              // ),
            ),
          ),
        ));
  }
}
