/**
 * Author: Mausam Rayamajhi
 * profile: https://github.com/mausamRayamajhi
 */

import 'package:flutter/material.dart';
import 'package:sindh_bar_council/models/Myprofilemodel.dart';

import '../constants.dart';
import 'ProfileImage.dart';


class TopAccountInfo extends StatelessWidget {
  Myprofilemodel user;


  TopAccountInfo(this.user);

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Card(
      elevation: 3.0,
      margin: EdgeInsets.symmetric(
        //horizontal: deviceSize.width * 0.03,
        vertical: deviceSize.height * 0.02,
      ),
      child: Container(
        alignment: Alignment.center,
        height: deviceSize.height * 0.2,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ProfileImage(image: user.advImage,),
                getdata(),
              ],
            ),

          ],
        ),
      ),
    );
  }

  Widget getdata(){
    return  Expanded(
      child: Container(
        padding: EdgeInsets.only(
          left: 15.0,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              user.advName,
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[


                Text(
                  'Reg No:'+user.preRegNo,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.fade,
                ),
                SizedBox(
                  width: 10.0,
                ),

              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[

                Text(
                  'District :'+user.divName,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.fade,
                ),
                SizedBox(
                  width: 10.0,
                ),

              ],
            ),

          ],
        ),
      ),
    );

  }
}