

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sindh_bar_council/members/members.dart';
import 'package:sindh_bar_council/qrcode/Qrcodescanner.dart';

import '../constants.dart';
import '../constants.dart';
import '../home/ProfileImage.dart';
import '../home/home.dart';

class Drawermain extends StatelessWidget {
  String image,name;


  Drawermain(this.image,this.name);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          buildUserInfo(context,image,name),
      Expanded(
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
                              default: {
                                //statements;
                              }
                              break;
                            }

                          },
                          leading: Icon(
                            item.icon,
                            color: Colors.white70,
                          ),
                          title: Text(
                            item.title,
                            style: TextStyle(
                              color: Colors.white70,
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
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: ListTile(
                      leading: Icon(
                        Icons.lock,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Logout',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
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
                        color: Colors.white70,
                      ),
                      title: Text(
                        item.title,
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            ListTile(
              leading: Icon(
                Icons.lock,
                color: Colors.white,
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
                      color: Colors.white70,
                    ),
                    title: Text(
                      item.title,
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          ListTile(
            leading: Icon(
              Icons.lock,
              color: Colors.white,
            ),
            title: Text(
              'Logout',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    ),
  ),
);

buildUserInfo(context,String image,String name) => Container(
  color: drawerColoPrimary,
  //height: deviceSize.height * 0.3,
  padding: EdgeInsets.only(bottom: 25.0),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      ListTile(
        onTap: () {
          Navigator.of(context).pop();
        },
        leading: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Good Afternoon!',
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 5,
          ),

        ],
      ),
      SizedBox(
        height: 15.0,
      ),
      ProfileImage(
        color: Colors.white,
        height: 70.0,
        width: 70.0,
        image: image,
      ),
      SizedBox(
        height: 15.0,
      ),
      Text(
        name.toUpperCase(),
        style: TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.w300,
          color: Colors.white,
        ),
      )
    ],
  ),
);
