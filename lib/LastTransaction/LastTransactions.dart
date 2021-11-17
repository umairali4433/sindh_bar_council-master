/**
 * Author: Mausam Rayamajhi
 * profile: https://github.com/mausamRayamajhi
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sindh_bar_council/categories/Heading.dart';
import 'package:sindh_bar_council/models/Notification.dart';

import '../constants.dart';
import 'Transaction.dart';


class LastTransactions extends StatelessWidget {
  List<NotificationModel> getlist;

  LastTransactions(this.getlist);

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          height: 10.0,
        ),
        Heading(
         'Recent Notification',
        ),
        SizedBox(
          height: 25.0,
        ),
        Flexible(
          child: Container(
            // color: Colors.red,
            height: deviceSize.height * 0.3,
            child: ListView.builder(
              shrinkWrap: true,
              // physics: NeverScrollableScrollPhysics(),
              physics: BouncingScrollPhysics(),
              itemCount: getlist.length>=5?5:getlist.length,
              itemBuilder: (context, int index) {
               return Column(
                 children: [
                   Card(
                     elevation: 8,
                     child: ListTile(
                       leading: Card(
                         elevation: 5,
                         child: Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Icon(
                             Icons.notification_important,
                             color: Colors.black,
                           ),
                         ),
                       ),
                       title: Text(getlist[index].postTitle),
                       subtitle: Text(getlist[index].postDate),
                     ),
                   ),
                   Divider()
                 ],
               );
              }
            ),
          ),
        ),
      ],
    );
  }
}
