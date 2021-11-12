import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sindh_bar_council/drawer/Drawermain.dart';
import 'package:sindh_bar_council/models/members.dart';

import '../Base.dart';

class MembersUI extends StatefulWidget {
  @override
  _MembersState createState() => _MembersState();
}

class _MembersState extends State<MembersUI> with TickerProviderStateMixin {
   TabController _tabController;
  bool flag = true;
  Future<Members> membersmodel;
  List<getmembers> getallmembers = [];
  List<String> geturls = ['members/members_karachi_api','members/members_hyderabad_api','members/members_sukkur_api','members/members_larkana_api','members/members_mirpurkhas_api'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: 5, vsync: this);
    getdata();

  }
  @override
  Widget build(BuildContext context) {
    return flag?Center(child: Text('Pleaase wait'),):Scaffold(
      appBar:  AppBar(
        bottom: TabBar(
          isScrollable: true,
          labelStyle: TextStyle(fontSize: 13.0 ),
          controller: _tabController,
          tabs: [
            Tab(text: 'Karachi',),
            Tab(text: 'Hyderabad',),
            Tab(text: 'Sukkhur',),
            Tab(text: 'Larkana',),
            Tab(text: 'MirpurKhas',)
          ],
        ),
      ),
      body: TabBarView(
controller: _tabController,
children: [
  Karachimember(getallmembers[0].members),
  Karachimember(getallmembers[1].members),
  Karachimember(getallmembers[2].members),
  Karachimember(getallmembers[3].members),
  Karachimember(getallmembers[4].members),
],
      ),
    );
  }

  Karachimember(List<Members> getmemberslist) {


    return SingleChildScrollView(
      child: ListView.separated(
          reverse: true,
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          separatorBuilder: (context, index) {
            return const SizedBox(height: 10.0);
          },
          itemCount: getmemberslist.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 2,
              color: Colors.white,
              child:Row(
                children: [
                  CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(getmemberslist[index].postImage),

                      ),
                  SizedBox(width: 10),
                  Container(width: 1,height: MediaQuery.of(context).size.height*0.1, color: Colors.black),
                  SizedBox(width: 50),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(getmemberslist[index].memberName,style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),),
                      Text(getmemberslist[index].designation,style: TextStyle(

                      ),),
                      Text(getmemberslist[index].mobile,style: TextStyle(

                      ),),
                    ],
                  )

                ],
              ),
            );
          }),
    );
  }

  void getdata() {
    membersmodel = Memberdata(geturls[0]).then((value){

      getallmembers.add(new getmembers(0, value));

      membersmodel = Memberdata(geturls[1]).then((value){

        getallmembers.add(new getmembers(1, value));

        membersmodel = Memberdata(geturls[2]).then((value){

          getallmembers.add(new getmembers(2, value));

          membersmodel = Memberdata(geturls[3]).then((value){

            getallmembers.add(new getmembers(3, value));

            membersmodel = Memberdata(geturls[4]).then((value){

              getallmembers.add(new getmembers(4, value));
              setState(() {
                flag = false;
              });



            });

          });

        });

      });

    });
  }
}
