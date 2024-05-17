/*import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../asma/all.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  _SplashScreenState createState() => _SplashScreenState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    //set time to load the new page
    Future.delayed(Duration(seconds: 6), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home()));
    });
    super.initState();
  }


class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
           alignment: Alignment.center,
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.center,
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
                  
                  SizedBox(height: 140, width: 190, child: Lottie.asset ("assets/logo1.png")),
                  SizedBox(height: 20,),
                  Text ("IsQini", style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Color(0xff1DA5C2),)),
             ],
           ),
           
        ),
    );
  }
}*/
