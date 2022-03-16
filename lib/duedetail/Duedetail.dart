import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sindh_bar_council/models/Myprofilemodel.dart';
import 'package:sindh_bar_council/models/due_detail_model.dart';

import '../Base.dart';
import '../constants.dart';

class Duedetail extends StatefulWidget {
  final String regid,distname,image,myhlc;


  Duedetail(this.regid, this.distname, this.image, this.myhlc);

  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<Duedetail>
    with SingleTickerProviderStateMixin {

  Future<DueDetailModel> gettaskfuture;
  bool flag = true;
  DueDetailModel myprofiledata;
  bool _status = true;
  final FocusNode myFocusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: flag?Center(
          child: Text('Please Wait'),
        ):
        SingleChildScrollView(
          child: Stack(
              children: <Widget>[
                Container(
              height: MediaQuery.of(context).size.height*0.2,
              decoration: BoxDecoration(
                gradient: linearGradient,
                color: primaryColor,
                //image: DecorationImage(image: NetworkImage('https://www.viajejet.com/wp-content/viajes/Lago-Moraine-Parque-Nacional-Banff-Alberta-Canada-1440x810.jpg'))
              ),

            ),
                Center(
                  child: Container(
                    padding: EdgeInsets.only(top: 80),
                    margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.03,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 70,
                          child: CircleAvatar(
                            backgroundColor: Colors.green,
                            radius: 68,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 60,
                              child: CircleAvatar(
                                radius: 58,
                                backgroundImage: NetworkImage('https://images.unsplash.com/photo-1646903232892-4a5d5451231a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
                              ),

                            ),
                          ),
                        ),
                        SizedBox(height: 8,),
                        Text(myprofiledata.advName,style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.black),),
                        SizedBox(height: 3,),
                        Text(myprofiledata.enrollType,style: TextStyle(fontSize: 18),),
                        SizedBox(height: 10,),
                        Card(
                          elevation: 5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('Paid Upto',style: TextStyle(fontWeight: FontWeight.bold)),
                              Text(myprofiledata.paidUpto),
                              ElevatedButton(onPressed: (){}, child: Text('Yearly'))
                            ],
                          ),
                        ),
                        SizedBox(height: 3,),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Card(
                            elevation: 9,
                            child:  Column(
                              children: [
                                SizedBox(
                                  height: 30,
                                ),
                                Text('Name',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                                Text(myprofiledata.advName,style: TextStyle(fontSize: 22),)
                                ,
                                SizedBox(
                                  height: 10,
                                ),
                                Text('- - - - - - - - - - - - - - - - - - - - - - -',style: TextStyle(fontSize: 22),),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('Father Name',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                                Text(myprofiledata.advFname,style: TextStyle(fontSize: 22),)
                                ,
                                SizedBox(
                                  height: 10,
                                ),
                                Text('- - - - - - - - - - - - - - - - - - - - - - -',style: TextStyle(fontSize: 22),)
                                ,
                                SizedBox(
                                  height: 10,
                                ),
                                Text('Gender',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                                Text(myprofiledata.gender,style: TextStyle(fontSize: 22),)
                                ,
                                SizedBox(
                                  height: 10,
                                ),
                                Text('- - - - - - - - - - - - - - - - - - - - - - -',style: TextStyle(fontSize: 22),)
                                ,
                                SizedBox(
                                  height: 10,
                                ),
                                Text('Date of Birth ',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                                Text(myprofiledata.dob.toString(),style: TextStyle(fontSize: 22),)
                                ,SizedBox(
                                  height: 10,
                                ),



                              ],
                            ),
                          ),
                        )

                      ],
                    ),
                  ),
                ),

    ]
          ),
        )
        // new Container(
        //   color: Colors.white,
        //   child: new ListView(
        //     children: <Widget>[
        //       Column(
        //         children: <Widget>[
        //           Padding(
        //             padding: const EdgeInsets.all(8.0),
        //             child: Card(
        //               elevation: 8,
        //               child: new Container(
        //                 height: 250.0,
        //                 color: Colors.white,
        //                 child: new Column(
        //                   children: <Widget>[
        //
        //                     Padding(
        //                       padding: EdgeInsets.only(top: 20.0),
        //                       child: new Stack(fit: StackFit.loose, children: <Widget>[
        //                         new Row(
        //                           crossAxisAlignment: CrossAxisAlignment.center,
        //                           mainAxisAlignment: MainAxisAlignment.center,
        //                           children: <Widget>[
        //                             new Container(
        //                                 width: 140.0,
        //                                 height: 140.0,
        //                                 decoration: new BoxDecoration(
        //                                   shape: BoxShape.circle,
        //                                   image: new DecorationImage(
        //                                     image: NetworkImage(
        //                                         widget.image),
        //                                     fit: BoxFit.cover,
        //                                   ),
        //                                 )),
        //                           ],
        //                         ),
        //
        //                       ]),
        //                     )
        //                   ],
        //                 ),
        //               ),
        //             ),
        //           ),
        //           Padding(
        //             padding: const EdgeInsets.all(8.0),
        //             child: Card(
        //               elevation: 8,
        //               child: new Container(
        //                 color: Color(0xffFFFFFF),
        //                 child: Padding(
        //                   padding: EdgeInsets.only(bottom: 25.0),
        //                   child: new Column(
        //                     crossAxisAlignment: CrossAxisAlignment.start,
        //                     mainAxisAlignment: MainAxisAlignment.start,
        //                     children: <Widget>[
        //                       Padding(
        //                           padding: EdgeInsets.only(
        //                               left: 25.0, right: 25.0, top: 25.0),
        //                           child: new Row(
        //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                             mainAxisSize: MainAxisSize.max,
        //                             children: <Widget>[
        //                               new Column(
        //                                 mainAxisAlignment: MainAxisAlignment.start,
        //                                 mainAxisSize: MainAxisSize.min,
        //                                 children: <Widget>[
        //                                   new Text(
        //                                     'Parsonal Information',
        //                                     style: TextStyle(
        //                                         fontSize: 18.0,
        //                                         fontWeight: FontWeight.bold),
        //                                   ),
        //                                 ],
        //                               ),
        //
        //                             ],
        //                           )),
        //                       Padding(
        //                           padding: EdgeInsets.only(
        //                               left: 25.0, right: 25.0, top: 25.0),
        //                           child: new Row(
        //                             mainAxisSize: MainAxisSize.max,
        //                             children: <Widget>[
        //                               new Column(
        //                                 mainAxisAlignment: MainAxisAlignment.start,
        //                                 mainAxisSize: MainAxisSize.min,
        //                                 children: <Widget>[
        //                                   new Text(
        //                                     'Pre Registration No',
        //                                     style: TextStyle(
        //                                         fontSize: 16.0,
        //                                         fontWeight: FontWeight.bold),
        //                                   ),
        //                                 ],
        //                               ),
        //                             ],
        //                           )),
        //                       Padding(
        //                           padding: EdgeInsets.only(
        //                               left: 25.0, right: 25.0, top: 2.0),
        //                           child: new Row(
        //                             mainAxisSize: MainAxisSize.max,
        //                             children: <Widget>[
        //                               new Flexible(
        //                                 child: TextFormField(initialValue: myprofiledata.preRegNo),
        //                               ),
        //                             ],
        //                           )),
        //                       Padding(
        //                           padding: EdgeInsets.only(
        //                               left: 25.0, right: 25.0, top: 25.0),
        //                           child: new Row(
        //                             mainAxisSize: MainAxisSize.max,
        //                             children: <Widget>[
        //                               new Column(
        //                                 mainAxisAlignment: MainAxisAlignment.start,
        //                                 mainAxisSize: MainAxisSize.min,
        //                                 children: <Widget>[
        //                                   new Text(
        //                                     'Name',
        //                                     style: TextStyle(
        //                                         fontSize: 16.0,
        //                                         fontWeight: FontWeight.bold),
        //                                   ),
        //                                 ],
        //                               ),
        //                             ],
        //                           )),
        //                       Padding(
        //                           padding: EdgeInsets.only(
        //                               left: 25.0, right: 25.0, top: 2.0),
        //                           child: new Row(
        //                             mainAxisSize: MainAxisSize.max,
        //                             children: <Widget>[
        //                               new Flexible(
        //                                 child: TextFormField(initialValue: myprofiledata.advName),
        //                               ),
        //                             ],
        //                           )),
        //                       Padding(
        //                           padding: EdgeInsets.only(
        //                               left: 25.0, right: 25.0, top: 25.0),
        //                           child: new Row(
        //                             mainAxisSize: MainAxisSize.max,
        //                             children: <Widget>[
        //                               new Column(
        //                                 mainAxisAlignment: MainAxisAlignment.start,
        //                                 mainAxisSize: MainAxisSize.min,
        //                                 children: <Widget>[
        //                                   new Text(
        //                                     'Father Name',
        //                                     style: TextStyle(
        //                                         fontSize: 16.0,
        //                                         fontWeight: FontWeight.bold),
        //                                   ),
        //                                 ],
        //                               ),
        //                             ],
        //                           )),
        //                       Padding(
        //                           padding: EdgeInsets.only(
        //                               left: 25.0, right: 25.0, top: 2.0),
        //                           child: new Row(
        //                             mainAxisSize: MainAxisSize.max,
        //                             children: <Widget>[
        //                               new Flexible(
        //                                 child:TextFormField(initialValue: myprofiledata.advFname),
        //                               ),
        //                             ],
        //                           )),
        //
        //                       Padding(
        //                           padding: EdgeInsets.only(
        //                               left: 25.0, right: 25.0, top: 25.0),
        //                           child: new Row(
        //                             mainAxisSize: MainAxisSize.max,
        //                             children: <Widget>[
        //                               new Column(
        //                                 mainAxisAlignment: MainAxisAlignment.start,
        //                                 mainAxisSize: MainAxisSize.min,
        //                                 children: <Widget>[
        //                                   new Text(
        //                                     'Gender',
        //                                     style: TextStyle(
        //                                         fontSize: 16.0,
        //                                         fontWeight: FontWeight.bold),
        //                                   ),
        //                                 ],
        //                               ),
        //                             ],
        //                           )),
        //                       Padding(
        //                           padding: EdgeInsets.only(
        //                               left: 25.0, right: 25.0, top: 2.0),
        //                           child: new Row(
        //                             mainAxisSize: MainAxisSize.max,
        //                             children: <Widget>[
        //                               new Flexible(
        //                                 child:TextFormField(initialValue: myprofiledata.gender),
        //                               ),
        //                             ],
        //                           )),
        //                       Padding(
        //                           padding: EdgeInsets.only(
        //                               left: 25.0, right: 25.0, top: 25.0),
        //                           child: new Row(
        //                             mainAxisSize: MainAxisSize.max,
        //                             mainAxisAlignment: MainAxisAlignment.start,
        //                             children: <Widget>[
        //                               Expanded(
        //                                 child: Container(
        //                                   child: new Text(
        //                                     'District',
        //                                     style: TextStyle(
        //                                         fontSize: 16.0,
        //                                         fontWeight: FontWeight.bold),
        //                                   ),
        //                                 ),
        //                                 flex: 2,
        //                               ),
        //                               Expanded(
        //                                 child: Container(
        //                                   child: new Text(
        //                                     'Division',
        //                                     style: TextStyle(
        //                                         fontSize: 16.0,
        //                                         fontWeight: FontWeight.bold),
        //                                   ),
        //                                 ),
        //                                 flex: 2,
        //                               ),
        //                             ],
        //                           )),
        //                       Padding(
        //                           padding: EdgeInsets.only(
        //                               left: 25.0, right: 25.0, top: 2.0),
        //                           child: new Row(
        //                             mainAxisSize: MainAxisSize.max,
        //                             mainAxisAlignment: MainAxisAlignment.start,
        //                             children: <Widget>[
        //                               Flexible(
        //                                 child: Padding(
        //                                   padding: EdgeInsets.only(right: 10.0),
        //                                   child: TextFormField(initialValue: myprofiledata.disName),
        //                                 ),
        //                                 flex: 2,
        //                               ),
        //                               Flexible(
        //                                 child: TextFormField(initialValue: myprofiledata.divName),
        //                                 flex: 2,
        //                               ),
        //                             ],
        //                           )),
        //                       Padding(
        //                           padding: EdgeInsets.only(
        //                               left: 25.0, right: 25.0, top: 25.0),
        //                           child: new Row(
        //                             mainAxisSize: MainAxisSize.max,
        //                             children: <Widget>[
        //                               new Column(
        //                                 mainAxisAlignment: MainAxisAlignment.start,
        //                                 mainAxisSize: MainAxisSize.min,
        //                                 children: <Widget>[
        //                                   new Text(
        //                                     'Date Of Birth',
        //                                     style: TextStyle(
        //                                         fontSize: 16.0,
        //                                         fontWeight: FontWeight.bold),
        //                                   ),
        //                                 ],
        //                               ),
        //                             ],
        //                           )),
        //                       Padding(
        //                           padding: EdgeInsets.only(
        //                               left: 25.0, right: 25.0, top: 2.0),
        //                           child: new Row(
        //                             mainAxisSize: MainAxisSize.max,
        //                             children: <Widget>[
        //                               new Flexible(
        //                                 child:TextFormField(initialValue: myprofiledata.dob.toString()),
        //                               ),
        //                             ],
        //                           )),
        //                       Padding(
        //                           padding: EdgeInsets.only(
        //                               left: 25.0, right: 25.0, top: 25.0),
        //                           child: new Row(
        //                             mainAxisSize: MainAxisSize.max,
        //                             children: <Widget>[
        //                               new Column(
        //                                 mainAxisAlignment: MainAxisAlignment.start,
        //                                 mainAxisSize: MainAxisSize.min,
        //                                 children: <Widget>[
        //                                   new Text(
        //                                     'Enroll Type',
        //                                     style: TextStyle(
        //                                         fontSize: 16.0,
        //                                         fontWeight: FontWeight.bold),
        //                                   ),
        //                                 ],
        //                               ),
        //                             ],
        //                           )),
        //                       Padding(
        //                           padding: EdgeInsets.only(
        //                               left: 25.0, right: 25.0, top: 2.0),
        //                           child: new Row(
        //                             mainAxisSize: MainAxisSize.max,
        //                             children: <Widget>[
        //                               new Flexible(
        //                                 child:TextFormField(initialValue: myprofiledata.enrollType),
        //                               ),
        //                             ],
        //                           )),
        //
        //                       Padding(
        //                           padding: EdgeInsets.only(
        //                               left: 25.0, right: 25.0, top: 25.0),
        //                           child: new Row(
        //                             mainAxisSize: MainAxisSize.max,
        //                             mainAxisAlignment: MainAxisAlignment.start,
        //                             children: <Widget>[
        //                               Expanded(
        //                                 child: Container(
        //                                   child: new Text(
        //                                     'Enroll Lower Court',
        //                                     style: TextStyle(
        //                                         fontSize: 16.0,
        //                                         fontWeight: FontWeight.bold),
        //                                   ),
        //                                 ),
        //                                 flex: 2,
        //                               ),
        //                               Expanded(
        //                                 child: Container(
        //                                   child: new Text(
        //                                     'Enroll High Court',
        //                                     style: TextStyle(
        //                                         fontSize: 16.0,
        //                                         fontWeight: FontWeight.bold),
        //                                   ),
        //                                 ),
        //                                 flex: 2,
        //                               ),
        //                             ],
        //                           )),
        //                       Padding(
        //                           padding: EdgeInsets.only(
        //                               left: 25.0, right: 25.0, top: 2.0),
        //                           child: new Row(
        //                             mainAxisSize: MainAxisSize.max,
        //                             mainAxisAlignment: MainAxisAlignment.start,
        //                             children: <Widget>[
        //                               Flexible(
        //                                 child: Padding(
        //                                   padding: EdgeInsets.only(right: 10.0),
        //                                   child: TextFormField(initialValue: myprofiledata.enrollLcDate),
        //                                 ),
        //                                 flex: 2,
        //                               ),
        //                               Flexible(
        //                                 child: TextFormField(initialValue: myprofiledata.enrollHcDate),
        //                                 flex: 2,
        //                               ),
        //                             ],
        //                           )),
        //                       Padding(
        //                           padding: EdgeInsets.only(
        //                               left: 25.0, right: 25.0, top: 25.0),
        //                           child: new Row(
        //                             mainAxisSize: MainAxisSize.max,
        //                             children: <Widget>[
        //                               new Column(
        //                                 mainAxisAlignment: MainAxisAlignment.start,
        //                                 mainAxisSize: MainAxisSize.min,
        //                                 children: <Widget>[
        //                                   new Text(
        //                                     'Paid Upto',
        //                                     style: TextStyle(
        //                                         fontSize: 16.0,
        //                                         fontWeight: FontWeight.bold),
        //                                   ),
        //                                 ],
        //                               ),
        //                             ],
        //                           )),
        //                       Padding(
        //                           padding: EdgeInsets.only(
        //                               left: 25.0, right: 25.0, top: 2.0),
        //                           child: new Row(
        //                             mainAxisSize: MainAxisSize.max,
        //                             children: <Widget>[
        //                               new Flexible(
        //                                 child:TextFormField(initialValue: myprofiledata.paidUpto),
        //                               ),
        //                             ],
        //                           )),
        //                       myprofiledata.bFund!=null?Padding(
        //                           padding: EdgeInsets.only(
        //                               left: 25.0, right: 25.0, top: 25.0),
        //                           child: new Row(
        //                             mainAxisSize: MainAxisSize.max,
        //                             children: <Widget>[
        //                               new Column(
        //                                 mainAxisAlignment: MainAxisAlignment.start,
        //                                 mainAxisSize: MainAxisSize.min,
        //                                 children: <Widget>[
        //                                   new Text(
        //                                     'Benevolent Fund',
        //                                     style: TextStyle(
        //                                         fontSize: 16.0,
        //                                         fontWeight: FontWeight.bold),
        //                                   ),
        //                                 ],
        //                               ),
        //                             ],
        //                           )):SizedBox(),
        //                       myprofiledata.bFund!=null?Padding(
        //                           padding: EdgeInsets.only(
        //                               left: 25.0, right: 25.0, top: 2.0),
        //                           child: new Row(
        //                             mainAxisSize: MainAxisSize.max,
        //                             children: <Widget>[
        //                               new Flexible(
        //                                 child:TextFormField(initialValue: ''),
        //                               ),
        //                             ],
        //                           )):SizedBox(),
        //                   myprofiledata.renewal != "" && myprofiledata.renewal!=null ?Padding(
        //                           padding: EdgeInsets.only(
        //                               left: 25.0, right: 25.0, top: 25.0),
        //                           child: new Row(
        //                             mainAxisSize: MainAxisSize.max,
        //                             children: <Widget>[
        //                               new Column(
        //                                 mainAxisAlignment: MainAxisAlignment.start,
        //                                 mainAxisSize: MainAxisSize.min,
        //                                 children: <Widget>[
        //                                   new Text(
        //                                     'Renewal',
        //                                     style: TextStyle(
        //                                         fontSize: 16.0,
        //                                         fontWeight: FontWeight.bold),
        //                                   ),
        //                                 ],
        //                               ),
        //                             ],
        //                           ))
        //                           :SizedBox(),
        //                       myprofiledata.renewal!=null&& myprofiledata.renewal != ''?Padding(
        //                           padding: EdgeInsets.only(
        //                               left: 25.0, right: 25.0, top: 2.0),
        //                           child: new Row(
        //                             mainAxisSize: MainAxisSize.max,
        //                             children: <Widget>[
        //                               new Flexible(
        //                                 child:TextFormField(initialValue: myprofiledata.renewal),
        //                               ),
        //                             ],
        //                           )):SizedBox(),
        //                       Padding(
        //                           padding: EdgeInsets.only(
        //                               left: 25.0, right: 25.0, top: 25.0),
        //                           child: new Row(
        //                             mainAxisSize: MainAxisSize.max,
        //                             children: <Widget>[
        //                               new Column(
        //                                 mainAxisAlignment: MainAxisAlignment.start,
        //                                 mainAxisSize: MainAxisSize.min,
        //                                 children: <Widget>[
        //                                   new Text(
        //                                     'Status',
        //                                     style: TextStyle(
        //                                         fontSize: 16.0,
        //                                         fontWeight: FontWeight.bold),
        //                                   ),
        //                                 ],
        //                               ),
        //                             ],
        //                           )),
        //                       Padding(
        //                           padding: EdgeInsets.only(
        //                               left: 25.0, right: 25.0, top: 2.0),
        //                           child: new Row(
        //                             mainAxisSize: MainAxisSize.max,
        //                             children: <Widget>[
        //                               new Flexible(
        //                                 child:TextFormField(initialValue: myprofiledata.status),
        //                               ),
        //                             ],
        //                           )),
        //
        //
        //
        //
        //                     ],
        //                   ),
        //                 ),
        //               ),
        //             ),
        //           )
        //         ],
        //       ),
        //     ],
        //   ),
        );
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }

  Widget _getActionButtons() {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Container(
                  child: new RaisedButton(
                    child: new Text("Save"),
                    textColor: Colors.white,
                    color: Colors.green,
                    onPressed: () {
                      setState(() {
                        _status = true;
                        FocusScope.of(context).requestFocus(new FocusNode());
                      });
                    },
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0)),
                  )),
            ),
            flex: 2,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Container(
                  child: new RaisedButton(
                    child: new Text("Cancel"),
                    textColor: Colors.white,
                    color: Colors.red,
                    onPressed: () {
                      setState(() {
                        _status = true;
                        FocusScope.of(context).requestFocus(new FocusNode());
                      });
                    },
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0)),
                  )),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }

  Future<void> getdata() async {
     SharedPreferences prefs = await SharedPreferences.getInstance().then((value) {
       value.getString('hlc');
       gettaskfuture =  duedetail(widget.regid,widget.distname,value.getString('hlc')).then((value) {
         myprofiledata = value;
         setState(() {
           flag = false;
         });
       });
     });


  }
}