/**
 * Author: Mausam Rayamajhi
 * profile: https://github.com/mausamRayamajhi
 */


import 'dart:convert';
import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sindh_bar_council/Aboutus/aboutus.dart';
import 'package:sindh_bar_council/Chairman/Chairman.dart';
import 'package:sindh_bar_council/Committees/Committees.dart';
import 'package:sindh_bar_council/LastTransaction/LastTransactions.dart';
import 'package:sindh_bar_council/Myprofile/Myprofile.dart';
import 'package:sindh_bar_council/News/News.dart';
import 'package:sindh_bar_council/Notification/NotificationUI.dart';
import 'package:sindh_bar_council/RegisteredFirm/RegisteredFirm.dart';
import 'package:sindh_bar_council/Sbc_staff/Sbc_staff.dart';
import 'package:sindh_bar_council/ViceChairman/Vicechairman.dart';
import 'package:sindh_bar_council/categories/Categories.dart';
import 'package:sindh_bar_council/chairman_exc_/Chairman_exc.dart';
import 'package:sindh_bar_council/drawer/Drawermain.dart';
import 'package:sindh_bar_council/duedetail/Duedetail.dart';
import 'package:sindh_bar_council/members/members.dart';
import 'package:sindh_bar_council/models/Myprofilemodel.dart';
import 'package:sindh_bar_council/models/Notification.dart';
import 'package:sindh_bar_council/payment/payment.dart';

import '../Base.dart';
import '../constants.dart';
import '../main.dart';
import 'TopAccountInfo.dart';
class Home_page extends StatefulWidget {
  int get;
  String param;

  @override
  _Home_pageState createState() => _Home_pageState();

  Home_page(this.get,this.param);
}

class _Home_pageState extends State<Home_page> {
  Myprofilemodel user;
  Map userMap;
  DateTime pickdate;
  SharedPreferences prefs;
  // List<NotificationModel> notificationlist;
  // Future<NotificationModel> gettaskfuture;
  int flag = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pickdate = new DateTime.now();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                color: Colors.blue,
                playSound: true,
                icon: '@mipmap/ic_launcher',
              ),
            ));
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification?.android;
      if (notification != null && android != null) {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text(notification.title),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(notification.body)],
                  ),
                ),
              );
            });
      }
    });
    getsharedvalue();
  }
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return  WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        drawer: flag==2?Drawermain(user.advImage,user.advName):Text('Please Try again',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
        appBar: buildAppBar(),
        body: flag==0?Stack(children: <Widget>[ Center(child:Text('Please wait'))]):flag==1?Center(child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              Text('Incorrect Date of Birth please Try Again',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              Icon(Icons.refresh),
              ElevatedButton(
                onPressed: (){
                  getsharedvalue();
                },
                child: Text('Try Again'),
              )
            ],
          ),
        ),):done(deviceSize),
      ),
    );
  }
  done(Size deviceSize){
    if(widget.get ==0){
      return buildStack(deviceSize);
    }
    else if(widget.get==1){
    // return Committees();
    //   // return MembersUI();
    }
    else if(widget.get==2){

      return MembersUI();
    }
    else if(widget.get==3){
      return Committees();
      // return MembersUI();
    }
    else if(widget.get==4){
      return RegisteredFirms();
      // return MembersUI();
    }

    else if(widget.get==5){
      return Chairman();
      // return MembersUI();
    }
    else if(widget.get==6){
      return Vicechairman();
      // return MembersUI();
    }
    else if(widget.get==7){
      return Chairman_exc();
      // return MembersUI();
    }
    else if(widget.get==8){
      return Sbc_staff();
      // print('adsd');
      // return MembersUI();
    }
    else if(widget.get==9){
      if(flag == 2){
        return Myprofile(user);
      }
    }

    else if(widget.get==10){
      if(flag == 2){
        return Duedetail(user.preRegNo,user.disName,user.advImage,user.myhlc);
      }
      // return MembersUI();
    }
    else if(widget.get==11){
      return News();
      // return MembersUI();
    }
    else if(widget.get==12){
      return NotificationUI();
      // return MembersUI();
    }
    else if(widget.get==13){
      return Paymnent();
      // return MembersUI();
    }
    else if(widget.get==14){
      return Paymnent();
      // return MembersUI();
    }
    else if(widget.get==15){
      return Aboutus();
      // return MembersUI();
    }


  }
  Future<bool> _onWillPop() async {
    if(widget.get!=0){
      return
        Navigator. pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => Home_page(0,'Welcome to Sahulat'),
          ),
              (route) => false,
        );
    }
    else{
      return (await showDialog(
        context: context,
        builder: (context) => new AlertDialog(
          title: new Text('Are you sure?'),
          content: new Text('Do you want to exit an App'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: new Text('No'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: new Text('Yes'),
            ),
          ],
        ),
      )) ?? false;
    }

  }

  Stack buildStack(Size deviceSize) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CurvedBottomClipper(),
          child: Container(
            decoration: BoxDecoration(
              gradient: linearGradient
            ),
            height: deviceSize.height * 0.15,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: deviceSize.width * 0.03,
          ),
          child: Column(
            children: <Widget>[
              SizedBox(height: 40,),
              Container(
                  padding: EdgeInsets.only(top: 15),
                  child: Center(child: TopAccountInfo(user))),
              SizedBox(height: 8,),
              Text(user.advName,style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.black),),
              SizedBox(height: 3,),
              Text('Reg No: '+user.preRegNo,style: TextStyle(fontSize: 18,color: Colors.grey),),
              SizedBox(height: 3,),
              Text('District: '+user.divName,style: TextStyle(fontSize: 18,color: Colors.grey),),
              Flexible(
                fit: FlexFit.tight,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  children: <Widget>[
                    Categories(),
                     // LastTransactions(notificationlist),
                  ],
                ),
              ),

            ],
          ),
        )
      ],
    );
  }
  AppBar buildAppBar() {
    return AppBar(
      elevation: 0.0,
      // centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          SizedBox(
            width: 5,
          ),
          Expanded(
            child: Text(
              widget.param.toUpperCase(),
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      // actions: <Widget>[
      //   IconButton(
      //     icon: Image.asset('assets/images/ic_scan2pay_64_4.png'),
      //     tooltip: 'QR Scan',
      //     onPressed: () {},
      //   ),
      // ],
    );
  }

  Future<void> getsharedvalue() async {

     prefs = await SharedPreferences.getInstance().then((value) async {
      userMap = jsonDecode(value.getString('userData'));
      user = Myprofilemodel.fromJson(userMap);

      datemethod(value);
    });
    // Myprofilemodel user= jsonDecode(prefs.getString("userData"));



  }


  Future<void> datemethod(SharedPreferences value) async {
    if(value.getString('dob')!= ''){
      setState(() {
        flag = 2;
      });
    }
    else{
      DateTime get = new DateTime(1975,02,1);
      final DateTime picked = await showDatePicker(
          helpText: 'Please Select you date of Birth for the Confirmation',
          context: context,
          initialDate: get,
          firstDate: DateTime(1950, 8),
          lastDate: DateTime(pickdate.year));
      print(user.dob);
      if(user.dob == picked){
        flag = 2;
        value.setString('dob', 'done');
      }
      else{
        flag = 1;
      }
       user.myhlc = value.getString('hlc');
      setState(() {
        flag;
      });
    }

  }






}
class CurvedBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // I've taken approximate height of curved part of view
    // Change it if you have exact spec for it
    final roundingHeight = size.height ;

    // this is top part of path, rectangle without any rounding
    final filledRectangle =
    Rect.fromLTRB(0, 0, size.width, size.height -roundingHeight);

    // this is rectangle that will be used to draw arc
    // arc is drawn from center of this rectangle, so it's height has to be twice roundingHeight
    // also I made it to go 5 units out of screen on left and right, so curve will have some incline there
    final roundingRectangle = Rect.fromLTRB(
        -50, size.height - roundingHeight *2, size.width + 50, size.height);

    final path = Path();
    path.addRect(filledRectangle);

    // so as I wrote before: arc is drawn from center of roundingRectangle
    // 2nd and 3rd arguments are angles from center to arc start and end points
    // 4th argument is set to true to move path to rectangle center, so we don't have to move it manually
    path.arcTo(roundingRectangle, pi, -pi, true);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // returning fixed 'true' value here for simplicity, it's not the part of actual question, please read docs if you want to dig into it
    // basically that means that clipping will be redrawn on any changes
    return true;
  }
}

