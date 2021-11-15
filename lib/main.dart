import 'dart:async';
import 'dart:convert';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sindh_bar_council/qrcode/Qrcodescanner.dart';

import 'home/home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.green,
    ),
    home: SplashScreen()
  ));
}
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool flag = true;

  @override
  void initState() {
    super.initState();
    getdata().then((value) {

      setState(() {
        flag = value;
      });
    });

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body:Column(

        children: [
          Padding(
              padding: EdgeInsets.only(top: 400),
              child: Text('Sahulat',style: TextStyle(fontSize: 24,),)),
          Text('by'),
          Expanded(
            child: AnimatedSplashScreen(
              splash: Image.asset('assets/images/logo.gif'),
              nextScreen: flag?QRViewExample():Home_page(0,'Welcomem to Sahulat'),
              splashTransition: SplashTransition.fadeTransition,
              curve: Curves.easeInBack,

              duration: 3000,
            ),
          ),
        ],
      )

    );
  }


  Future<bool> getdata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getString('userData')== null){
      return true;
    }
    else{
      return false;
    }
  }

}



