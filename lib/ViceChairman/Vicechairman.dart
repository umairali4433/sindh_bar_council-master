import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sindh_bar_council/models/Vicechairman.dart';

import '../Base.dart';

class Vicechairman extends StatefulWidget {
  @override
  _VicechaormanState createState() => _VicechaormanState();
}

class _VicechaormanState extends State<Vicechairman> {
  Future<Vicechairmanmodel> gettaskfuture;
  bool flag = true;
  List<Vicechairmanmodel> registeredfirmlist;
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
          title: Text(registeredfirmlist[index].chairmanName),
          subtitle: Text(registeredfirmlist[index].fromDate+' - '+registeredfirmlist[index].toDate),
        );
      },
    );
  }
  void getdata() {
    gettaskfuture =  vicechairman().then((value) {
      registeredfirmlist = value;
      setState(() {
        flag = false;
      });
    });
  }
}
