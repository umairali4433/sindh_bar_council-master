import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sindh_bar_council/constants.dart';
import 'package:sindh_bar_council/models/News_model.dart';
import 'package:sindh_bar_council/models/Vicechairman.dart';

import '../Base.dart';
import 'newsphoto.dart';

class News extends StatefulWidget {
  @override
  _VicechaormanState createState() => _VicechaormanState();
}

class _VicechaormanState extends State<News> {
  Future<NewsModel> gettaskfuture;
  bool flag = true;
  List<NewsModel> newslist;
  List<NewsModel> backuplist;
  List<NewsModel> searchedlist;
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
    ):SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8.0),
            child: Card(
              elevation: 8,
              child: TextFormField(
                style: TextStyle(fontSize: 22.0),
                onChanged: (value){
                  if(value==""){

                    setState(() {
                      newslist = backuplist;
                    });
                  }
                  else{
                    getdatanewlist(value.toString());
                  }

                },
                decoration: InputDecoration(
                    contentPadding: new EdgeInsets.symmetric(vertical: 0.0),
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(0.0),
                      child: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ), // icon is 48px widget.
                    ),
                    hintText: 'What are you looking for',
                    hintStyle: TextStyle(fontSize: 22.0)),
              ),
            ),
          ),
          Text(' - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  - - - - - - - - - - - - - - - - - - ',style: TextStyle(color: Colors.grey),),
          ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: newslist.length,
            separatorBuilder: (BuildContext context, int index) => const Divider(),
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  GestureDetector(
                    onTap: (){

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Newsphoto(newslist[index].postImage)),
                      );
                    },
                    child: Card(
                      elevation: 8,
                      child: ListTile(
                        leading: Card(
                            elevation: 8,
                            child: Image.network(newslist[index].postImage)),
                        title: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text(newslist[index].postDate,style: TextStyle(color: primaryColor,fontWeight: FontWeight.bold)),
                        ),
                        subtitle: Container(
                            padding: const EdgeInsets.all(6.0),
                            height: 70,
                            child: Text(newslist[index].postTitle,style: TextStyle(color:Colors.black),)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }
  void getdata() {
    gettaskfuture =  newsdata().then((value) {
      newslist = value;
      backuplist = value;
      setState(() {
        flag = false;
      });
    });
  }

  void getdatanewlist(String value) {

    print(value);
    newslist = backuplist
        .where((element) =>
    element.postTitle.contains(value) || element.postDate.contains(value) )
        .toList();
    setState(() {
      newslist;
    });
  }
}
