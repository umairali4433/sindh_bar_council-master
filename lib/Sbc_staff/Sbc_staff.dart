import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sindh_bar_council/models/Chairman.dart';
import 'package:sindh_bar_council/models/Sbc_staff_model.dart';
import 'package:sindh_bar_council/models/chairman_exc_model.dart';

import '../Base.dart';
import '../Base.dart';

class Sbc_staff extends StatefulWidget {
  @override
  Sbc_staffstate createState() => Sbc_staffstate();
}

class Sbc_staffstate extends State<Sbc_staff> {
  Future<SbcStaffModel> gettaskfuture;
  bool flag = true;
  List<SbcStaffModel> sbcstafflist;
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
      itemCount: sbcstafflist.length,
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: CircleAvatar(
              backgroundImage: NetworkImage(sbcstafflist[index].postImage)
          ),
          title: Text(sbcstafflist[index].fullName,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sbcstafflist[index].designation==null?Text(''):Text(sbcstafflist[index].designation),
              sbcstafflist[index].mobile==null?Text(''):Text(sbcstafflist[index].mobile),
              sbcstafflist[index].working==null?Text(''):Text(sbcstafflist[index].working),

            ],
          )
        );
      },
    );
  }
  void getdata() {
    gettaskfuture =  sbc_staff().then((value) {
      sbcstafflist = value;
      setState(() {
        flag = false;
      });
    });
  }
}
