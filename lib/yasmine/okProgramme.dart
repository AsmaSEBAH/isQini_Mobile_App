//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/painting.dart';
//import 'home.dart';
//import 'homeArabe.dart';
//mport 'all.dart';
import '../asma/all.dart';

class OkProgramme extends StatelessWidget {
  const OkProgramme({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Text buildText(String text) => Text(text);
    return Material(
        child: Center(
            child: Container(
                //color: Colors.blue,
                height: 311,
                width: 306,
                //padding: EdgeInsets.all(50),
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 215,
                        width: 235,
                        decoration: BoxDecoration(
                          color: Color(0xFFF2EDE6),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 39.0,
                      right: 23.0,
                      child: InkWell(
                        child: Container(
                            //padding: EdgeInsets.all(0),
                            height: 22.0,
                            width: 22.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 2, color: Colors.black),
                            ),
                            child: Center(child: Icon(Icons.close, size: 20))),
                        //label: buildText(''),
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              //builder: (context) => const Horloge(),
                              builder: (context) => Home(),
                            ),
                          );
                        },
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                            child: Image.asset('assets/images/true.png'),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Text('Le mode programmé \nest activé', textAlign: TextAlign.center, style: TextStyle(fontSize: 20, color: Colors.black)),
                          ),
                        ],
                      ),
                    ),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                            padding: EdgeInsets.only(bottom: 34),
                            child: Container(
                              alignment: Alignment.center,
                              width: 108,
                              height: 32,
                              //padding: EdgeInsets.only(bottom: 25),
                              child: RaisedButton(
                                color: Color(0xFF2AF598),
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Home(),
                                    ),
                                  );
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Text('Ok', style: TextStyle(color: Colors.black, fontSize: 15)),
                              ),
                            ))),
                    /*  Positioned(
                       height: 108.8,
                       width: 150.67,
                          // bottom: ,
                          right: 24.0,
                         top: 30.0,
            //      left: 0.0,
                      child: Column(
                        children: const <Widget>[
                          child: Container(
                            alignment: Alignment.Center,
                            height: 22.67,
                    width: 23.54,
                    child: Image.asset('assets/images/true.png'),
                    )
                    
                            ]
              )*/
                  ],
                ))));
    //Text buildText(String text) => Text(text);
  }
}
