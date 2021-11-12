import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sindh_bar_council/models/Committemodel.dart';

import '../Base.dart';

class Committees extends StatefulWidget {
  @override
  _CommitteesState createState() => _CommitteesState();
}

class _CommitteesState extends State<Committees> {

  Future<Committee> gettaskfuture;
  bool flag = true;
  List<Committee> commiettlist;
  final ScrollController _scrollController = ScrollController();

  void _scrollToSelectedContent(bool isExpanded, double previousOffset, int index, GlobalKey myKey) {
    final keyContext = myKey.currentContext;

    if (keyContext != null) {
      // make sure that your widget is visible
      final box = keyContext.findRenderObject() as RenderBox;
      _scrollController.animateTo(isExpanded ? (box.size.height * index) : previousOffset,
          duration: Duration(milliseconds: 500), curve: Curves.linear);
    }
  }

  List<Widget> _buildExpansionTileChildren(int ind) => [
    ListView.separated(
      primary: false,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: commiettlist[ind].committeeData.length,
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(commiettlist[ind].committeeData[index].image),
          ),
          title: Text(commiettlist[ind].committeeData[index].memberName,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
          subtitle: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Text(commiettlist[ind].committeeData[index].title),
                SizedBox(height: 10,),
                Text(commiettlist[ind].committeeData[index].mobile),
              ],
            ),
          ),
        );
      },
    )
  ];

  ExpansionTile _buildExpansionTile(int index) {
    final GlobalKey expansionTileKey = GlobalKey();
    double previousOffset;

    return ExpansionTile(
      key: expansionTileKey,
      onExpansionChanged: (isExpanded) {
        if (isExpanded) previousOffset = _scrollController.offset;
        _scrollToSelectedContent(isExpanded, previousOffset, index, expansionTileKey);
      },
      title: Text(commiettlist[index].committeeName),
      children: _buildExpansionTileChildren(index),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: flag?Center(
        child: Text('Please Wait'),
      ):ListView.builder(
        controller: _scrollController,
        itemCount: commiettlist.length,
        itemBuilder: (BuildContext context, int index) => _buildExpansionTile(index),
      ),
    );
  }
  void getdata() {
    gettaskfuture =  committeedata().then((value) {
      commiettlist = value;
      setState(() {
        flag = false;
      });
    });

  }

}


