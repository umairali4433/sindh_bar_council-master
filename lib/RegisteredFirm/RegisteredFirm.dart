import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sindh_bar_council/models/RegisteredFirmmodel.dart';

import '../Base.dart';

class RegisteredFirms extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<RegisteredFirms> {
  Future<Registeredfirms> gettaskfuture;
  bool flag = true;
  List<Registeredfirms> registeredfirmlist;
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
            backgroundImage: NetworkImage('https://images.unsplash.com/photo-1556740714-a8395b3bf30f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1170&q=80')
          ),
          title: Text(registeredfirmlist[index].lawFirmsName,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
          subtitle: Text('Certficate ossued_on'+registeredfirmlist[index].certficateIssuedOn),
        );
      },
    );
  }

  void getdata() {
    gettaskfuture =  registeredfirms().then((value) {
      registeredfirmlist = value;
      setState(() {
        flag = false;
      });
    });
  }
}
