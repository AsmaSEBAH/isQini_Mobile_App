//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AideArabe extends StatelessWidget {
  const AideArabe({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Container(
          //color: Colors.blue,
          height: 500,
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
                        height: 160,
                        width: 299,
                        decoration: BoxDecoration(
                          color: Color(0xFFF2EDE6),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 10,
                      child: Image.asset('assets/images/automatique1.png'),
                    ),
                    Positioned(
                      top: 40,
                      right: 90,
                      child: Center(
                        child: Container(
                          alignment: Alignment.center,
                          child: Text('الوضع الآلي \n', textAlign: TextAlign.center, style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 70,
                      right: 30,
                      child: Center(
                        child: Container(
                          alignment: Alignment.center,
                          child: Text('سيتم ري النباتات بغض  \n النظر عن اختيار المستخدم.\n يعتمد الري على حاجة النبات \n (حسب عتبة درجة الحرارة\n والرطوبة ورطوبة التربة)', textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: Colors.black)),
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
                        height: 280,
                        width: 299,
                        decoration: BoxDecoration(
                          color: Color(0xFFF2EDE6),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 10,
                      child: Image.asset('assets/images/manuel1.png'),
                    ),
                    Positioned(
                      top: 40,
                      left: 90,
                      child: Center(
                        child: Container(
                          alignment: Alignment.center,
                          child: Text('الوضع اليدوي\n', textAlign: TextAlign.center, style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),

                    Positioned(
                      top: 85,
                      right: 25,
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
                                Text('بدأ \n', textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold)),
                                Image.asset('assets/images/demarrer1.png'),
                                Text('سيبدأ الري \n مباشرة \n', textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: Colors.black)),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              children: <Widget>[
                                Text('ضبط \n', textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold)),
                                Image.asset('assets/images/programme1.png'),
                                Text('سيتم تخصيص  \n الري  (التاريخ \n والوقت والتكرار)', textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: Colors.black)),
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
    );
  }
}
