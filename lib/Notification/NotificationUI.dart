import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sindh_bar_council/constants.dart';
import 'package:sindh_bar_council/models/Notification.dart';

import '../Base.dart';
import 'Subnotitication.dart';

class NotificationUI extends StatefulWidget {
  @override
  _ChairmanState createState() => _ChairmanState();
}

class _ChairmanState extends State<NotificationUI> {
  Future<NotificationModel> gettaskfuture;
  bool flag = true;
  List<NotificationModel> notificationlist;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }
  @override
  Widget build(BuildContext context) {
    return flag?Center(
      child: Text('Please Wait'),
    ):ListView.separated(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: notificationlist.length,
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Subnotitication(notificationlist[index].postTitle,notificationlist[index].postDescription,)),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(

                  children: [
                    Container(
                      width: 120,
                      height: 40,
                      decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(25),
                        color: primaryColor
                      ),
                      child: getdate(notificationlist[index].postDate),

                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Icon(
                        Icons.notifications,
                        color: Colors.black,
                      ),
                    ),

                  ],
                ),

              ),
              Container(
                  padding: EdgeInsets.only(left: 60),
                  height: 40, child: VerticalDivider(color: Colors.grey,thickness: 1,)),
              Container(
                padding: EdgeInsets.all(8),
                height: MediaQuery.of(context).size.height*.3,
                child: Card(
                  elevation: 8,
                  child:
                    Column(
                     children: [
                       Container(
                         padding: EdgeInsets.only(top: 25,left: 50),
                         child: Row(
                           children: [
                             Text(notificationlist[index].postTitle)
                           ],
                         ),
                       ),
                       SizedBox(height: 10,),
                       Container(
                           width: MediaQuery.of(context).size.width*.8,
                           child: Divider(thickness: 1,color: Colors.black,)),
                       SizedBox(height: 2,),
                       Row(
                         children: [
                           Expanded(
                             child: Container(
                                 padding: EdgeInsets.only(top: 10,left: 50,right: 20),
                                 child: Text(notificationlist[index].postDescription,overflow: TextOverflow.ellipsis,maxLines: 7,)),
                           )
                         ],
                       ),
                     ],
                    )
                  // ListTile(
                  //   leading: Card(
                  //     elevation: 5,
                  //     child: Padding(
                  //       padding: const EdgeInsets.all(8.0),
                  //       child: Icon(
                  //         Icons.notification_important,
                  //         color: Colors.black,
                  //       ),
                  //     ),
                  //   ),
                  //   title: Text(notificationlist[index].postTitle),
                  //   subtitle: Column(
                  //     children: [
                  //
                  //       Text(notificationlist[index].postDescription),
                  //     ],
                  //   ),
                  // ),
                ),
              ),
              Divider()
            ],
          ),
        );
      },
    );
  }
  void getdata() {
    gettaskfuture =  Notificationmethod().then((value) {
      notificationlist = value;
      setState(() {
        flag = false;
      });
    });
  }

  getdate(String date) {
    List<String> dat2e = date.split('Dated: ');
    // final date2 = DateTime.now();
    //
    // DateTime time = DateTime.parse(dat2e[1]);
    // final indays = time.difference(date2).inDays;


    return Center(child: Text(dat2e[1],style: TextStyle(color: Colors.white),));
  }
}
