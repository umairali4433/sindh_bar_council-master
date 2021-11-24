/**
 * Author: Mausam Rayamajhi
 * profile: https://github.com/mausamRayamajhi
 */


import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  // List<NotificationModel> notificationlist;
  // Future<NotificationModel> gettaskfuture;
  bool flag = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getsharedvalue();
  }
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return flag?Stack(  children: <Widget>[ Center(child:Text('Please wait'))]): WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        drawer: Drawermain(user.advImage,user.advName),
        appBar: buildAppBar(),
        body: done(deviceSize),
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
      if(flag == false){
        return Myprofile(user);
      }
    }

    else if(widget.get==10){
      if(flag == false){
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
        Container(
          color: primaryColor,
          height: deviceSize.height * 0.1,
        ),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: deviceSize.width * 0.03,
          ),
          child: Column(
            children: <Widget>[
              Center(child: TopAccountInfo(user)),
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
              )
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
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Myprofilemodel user= jsonDecode(prefs.getString("userData"));
     userMap = jsonDecode(prefs.getString('userData'));
    user = Myprofilemodel.fromJson(userMap);
    user.myhlc = prefs.getString('hlc');
    setState(() {
      flag = false;
    });


  }

  void getnotification() {


  }


}
