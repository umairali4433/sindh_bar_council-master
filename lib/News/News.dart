import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      itemCount: newslist.length,
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
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
                  child: Icon(Icons.notification_important,size: 40,)),
              title: Text(newslist[index].postTitle),
              subtitle: Card(
                  elevation: 8,
                  color: Colors.green,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(newslist[index].postDate),
                  )),
            ),
          ),
        );
      },
    );
  }
  void getdata() {
    gettaskfuture =  newsdata().then((value) {
      newslist = value;
      setState(() {
        flag = false;
      });
    });
  }
}
