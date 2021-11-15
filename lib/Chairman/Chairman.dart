import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sindh_bar_council/models/Chairman.dart';

import '../Base.dart';

class Chairman extends StatefulWidget {
  @override
  _ChairmanState createState() => _ChairmanState();
}

class _ChairmanState extends State<Chairman> {
  Future<Chairmanmodel> gettaskfuture;
  bool flag = true;
  List<Chairmanmodel> registeredfirmlist;
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
      itemCount: registeredfirmlist.length,
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: CircleAvatar(
              backgroundImage: NetworkImage(registeredfirmlist[index].postImage)
          ),
          title: Text(registeredfirmlist[index].chairmanName,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
          subtitle: Text(registeredfirmlist[index].fromDate+' - '+registeredfirmlist[index].toDate),
        );
      },
    );
  }
  void getdata() {
    gettaskfuture =  chairmanget().then((value) {
      registeredfirmlist = value;
      setState(() {
        flag = false;
      });
    });
  }
}
