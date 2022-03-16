

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sindh_bar_council/members/members.dart';
import 'package:sindh_bar_council/qrcode/Qrcodescanner.dart';

import '../constants.dart';
import '../constants.dart';
import '../home/ProfileImage.dart';
import '../home/home.dart';
import '../models/Myprofilemodel.dart';

class Drawermain extends StatelessWidget {
  String image,name;
  Myprofilemodel user;


  Drawermain(this.image,this.name,this.user);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          buildUserInfo(context,image,name,user),
      Container(
        padding: EdgeInsets.only(top: 25,bottom: 25),
        width: MediaQuery.of(context).size.width*.6,
        child: Divider(color: drawerColoSecondary,thickness: 2),
      ),
      Expanded(
        child: SingleChildScrollView(
          child: Container(

            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    for (Draw item in drawerItems)
                      GestureDetector(
                        child: ListTile(
                          onTap: (){
                            switch(item.title) {
                              case 'Home': {
                                navigatemethod(0,'',context);
                              }
                              break;

                              case 'Search': {
                                navigatemethod(1,'Search',context);
                                //statements;
                              }
                              break;

                              case 'Members': {
                                navigatemethod(2,'Members',context);
                                //statements;
                              }
                              break;

                              case 'Committees': {
                                navigatemethod(3,'Committees',context);
                                //statements;
                              }
                              break;


                              case 'Registered Firms': {
                                navigatemethod(4,'Registered Firms',context);
                                //statements;
                              }
                              break;

                              case 'Chairman': {
                                navigatemethod(5,'Chairman',context);
                                //statements;
                              }


                            break;
                              case 'Vice Chairman': {
                                navigatemethod(6,'Vice Chairman',context);
                                //statements;
                              }
                              break;
                              case 'Chairman EXC Committee': {
                                navigatemethod(7,'Chairman EXC Committee',context);
                                //statements;
                              }
                              break;

                              break;
                              case 'SBC Staff': {
                            navigatemethod(8,'SBC Staff',context);
                            //statements;
                            }
                            break;
                              //umair
                              case 'About us': {
                                navigatemethod(15,'About us',context);
                                //statements;
                              }
                              break;


                              default: {
                                //statements;
                              }
                              break;
                            }

                          },

                          title: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text(
                              item.title,
                              style: TextStyle(

                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                GestureDetector(
                  onTap: (){
                 sendit(context);
                  },
                  child: Column(

                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 25,bottom: 25),
                        width: MediaQuery.of(context).size.width*.6,
                        child: Divider(color: drawerColoSecondary,thickness: 2),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: ListTile(
                          leading: Icon(
                            Icons.lock,

                          ),
                          title: Text(
                            'Logout',
                            style: TextStyle(

                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )
        ],
      ),
    );
  }

  void navigatemethod(int i,String get,BuildContext context) {
    Navigator. pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) =>Home_page(i,get),
      ),
          (route) => false,
    );
  }

   sendit(BuildContext context) async {
     SharedPreferences preferences = await SharedPreferences.getInstance();
     await preferences.clear();
     Navigator. pushAndRemoveUntil(
       context,
       MaterialPageRoute(
         builder: (BuildContext context) =>QRViewExample(),
       ),
           (route) => false,
     );
   }
}

Widget get(){
  return Expanded(
    child: SingleChildScrollView(
      child: Container(
        color: drawerColoSecondary,
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                for (Draw item in drawerItems)
                  GestureDetector(
                    child: ListTile(
                      onTap: (){

                      },
                      leading: Icon(
                        item.icon,

                      ),
                      title: Text(
                        item.title,
                        style: TextStyle(

                        ),
                      ),
                    ),
                  ),
              ],
            ),
            ListTile(
              leading: Icon(
                Icons.lock,

              ),
              title: Text(
                'Logout',

              ),
            ),
          ],
        ),
      ),
    ),
  );
}
final buildDrawerItem = Flexible(
  child: SingleChildScrollView(
    child: Container(
      color: drawerColoSecondary,
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              for (Draw item in drawerItems)
                GestureDetector(
                  child: ListTile(
                    onTap: (){

                    },
                    leading: Icon(
                      item.icon,

                    ),
                    title: Text(
                      item.title,
                      style: TextStyle(

                      ),
                    ),
                  ),
                ),
            ],
          ),
          ListTile(
            leading: Icon(
              Icons.lock,

            ),
            title: Text(
              'Logout',
              style: TextStyle(

              ),
            ),
          ),
        ],
      ),
    ),
  ),
);

buildUserInfo(context,String image,String name,Myprofilemodel user) => Container(

  //height: deviceSize.height * 0.3,
  padding: EdgeInsets.only(top: 100,left: 25),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[



      ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(image),
            radius: 25,),
        title: Text(name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Reg No: '+user.preRegNo),
            Text('District: '+user.disName)
          ],
        ),
      ),


    ],
  ),
);
