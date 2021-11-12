import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sindh_bar_council/models/Notification.dart';

import '../Base.dart';

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
        return ListTile(
          leading: Icon(
            Icons.notification_important,
            color: Colors.white,
          ),
          title: Text(notificationlist[index].postTitle),
          subtitle: Text(notificationlist[index].postDate),
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
}
