import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sindh_bar_council/models/Myprofilemodel.dart';

import '../Base.dart';
import '../constants.dart';

class Myprofile extends StatefulWidget {
  Myprofilemodel myprofile;

  Myprofile(this.myprofile);

  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<Myprofile>
    with SingleTickerProviderStateMixin {

  Future<Myprofilemodel> gettaskfuture;
  bool flag = true;
  Myprofilemodel myprofiledata;
  bool _status = true;
  final FocusNode myFocusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myprofiledata = widget.myprofile;
    //getdata();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body:new Container(

          color: Colors.white,
          child: new ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  ClipPath(
                    clipper: MyClipper(),
                    child: Container(
                      height: 300.0,
                      decoration: BoxDecoration(
                        gradient: linearGradient,
                        color: primaryColor,
                        //image: DecorationImage(image: NetworkImage('https://www.viajejet.com/wp-content/viajes/Lago-Moraine-Parque-Nacional-Banff-Alberta-Canada-1440x810.jpg'))
                      ),
                      child: Center(
                        child: Column(
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
                                    backgroundImage: myprofiledata.advImage==null?Image.asset('assets/images/placeholder.png'):NetworkImage(myprofiledata.advImage),
                                  ),

                                ),
                              ),
                            ),
                            SizedBox(height: 20,),
                            Text(myprofiledata.advName,style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),),
                            SizedBox(height: 5,),
                            Text(myprofiledata.enrollType,style: TextStyle(color: Colors.white,fontSize: 20),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    color: Colors.white,
                    height: 50,
                    child: Text('Personal Information',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
                  ),
                  Container(

                    width: MediaQuery.of(context).size.width,
                    height: 600.0,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.8),
                      //image: DecorationImage(image: NetworkImage('https://www.viajejet.com/wp-content/viajes/Lago-Moraine-Parque-Nacional-Banff-Alberta-Canada-1440x810.jpg'))
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Text('Per Registration No',style: TextStyle(color: Colors.white,fontSize: 22),),
                        Text(myprofiledata.preRegNo,style: TextStyle(color: Colors.white,fontSize: 22),)
                        ,
                        SizedBox(
                          height: 30,
                        ),
                        Text('- - - - - - - - - - - - - - - - - - - - - - -',style: TextStyle(color: Colors.white,fontSize: 22),),
                        SizedBox(
                          height: 30,
                        ),
                        Text('Name',style: TextStyle(color: Colors.white,fontSize: 22),),
                        Text(myprofiledata.advName,style: TextStyle(color: Colors.white,fontSize: 22),)
                        ,
                        SizedBox(
                          height: 30,
                        ),
                        Text('- - - - - - - - - - - - - - - - - - - - - - -',style: TextStyle(color: Colors.white,fontSize: 22),)
                        ,
                        SizedBox(
                          height: 30,
                        ),
                        Text('Father Name',style: TextStyle(color: Colors.white,fontSize: 22),),
                        Text(myprofiledata.advFname,style: TextStyle(color: Colors.white,fontSize: 22),)
                        ,
                        SizedBox(
                          height: 30,
                        ),



                      ],
                    ),

                  ),


                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Card(
                  //     elevation: 8,
                  //     child: new Container(
                  //       height: 250.0,
                  //       color: Colors.white,
                  //       child: new Column(
                  //         children: <Widget>[
                  //
                  //           Padding(
                  //             padding: EdgeInsets.only(top: 20.0),
                  //             child: new Stack(fit: StackFit.loose, children: <Widget>[
                  //               new Row(
                  //                 crossAxisAlignment: CrossAxisAlignment.center,
                  //                 mainAxisAlignment: MainAxisAlignment.center,
                  //                 children: <Widget>[
                  //                   new Container(
                  //                       width: 140.0,
                  //                       height: 140.0,
                  //                       decoration: new BoxDecoration(
                  //                         shape: BoxShape.circle,
                  //                         image: new DecorationImage(
                  //                           image: NetworkImage(
                  //                               myprofiledata.advImage),
                  //                           fit: BoxFit.cover,
                  //                         ),
                  //                       )),
                  //                 ],
                  //               ),
                  //
                  //             ]),
                  //           )
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),

                  //personal information
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Card(
                  //     elevation: 8,
                  //     child: new Container(
                  //       color: Color(0xffFFFFFF),
                  //       child: Padding(
                  //         padding: EdgeInsets.only(bottom: 25.0),
                  //         child: new Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           mainAxisAlignment: MainAxisAlignment.start,
                  //           children: <Widget>[
                  //             Padding(
                  //                 padding: EdgeInsets.only(
                  //                     left: 25.0, right: 25.0, top: 25.0),
                  //                 child: new Row(
                  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //                   mainAxisSize: MainAxisSize.max,
                  //                   children: <Widget>[
                  //                     new Column(
                  //                       mainAxisAlignment: MainAxisAlignment.start,
                  //                       mainAxisSize: MainAxisSize.min,
                  //                       children: <Widget>[
                  //                         new Text(
                  //                           'Parsonal Information',
                  //                           style: TextStyle(
                  //                               fontSize: 18.0,
                  //                               fontWeight: FontWeight.bold),
                  //                         ),
                  //                       ],
                  //                     ),
                  //
                  //                   ],
                  //                 )),
                  //             Padding(
                  //                 padding: EdgeInsets.only(
                  //                     left: 25.0, right: 25.0, top: 25.0),
                  //                 child: new Row(
                  //                   mainAxisSize: MainAxisSize.max,
                  //                   children: <Widget>[
                  //                     new Column(
                  //                       mainAxisAlignment: MainAxisAlignment.start,
                  //                       mainAxisSize: MainAxisSize.min,
                  //                       children: <Widget>[
                  //                         new Text(
                  //                           'Pre Registration No',
                  //                           style: TextStyle(
                  //                               fontSize: 16.0,
                  //                               fontWeight: FontWeight.bold),
                  //                         ),
                  //                       ],
                  //                     ),
                  //                   ],
                  //                 )),
                  //             Padding(
                  //                 padding: EdgeInsets.only(
                  //                     left: 25.0, right: 25.0, top: 2.0),
                  //                 child: new Row(
                  //                   mainAxisSize: MainAxisSize.max,
                  //                   children: <Widget>[
                  //                     new Flexible(
                  //                       child: TextFormField(initialValue: myprofiledata.preRegNo),
                  //                     ),
                  //                   ],
                  //                 )),
                  //             Padding(
                  //                 padding: EdgeInsets.only(
                  //                     left: 25.0, right: 25.0, top: 25.0),
                  //                 child: new Row(
                  //                   mainAxisSize: MainAxisSize.max,
                  //                   children: <Widget>[
                  //                     new Column(
                  //                       mainAxisAlignment: MainAxisAlignment.start,
                  //                       mainAxisSize: MainAxisSize.min,
                  //                       children: <Widget>[
                  //                         new Text(
                  //                           'Name',
                  //                           style: TextStyle(
                  //                               fontSize: 16.0,
                  //                               fontWeight: FontWeight.bold),
                  //                         ),
                  //                       ],
                  //                     ),
                  //                   ],
                  //                 )),
                  //             Padding(
                  //                 padding: EdgeInsets.only(
                  //                     left: 25.0, right: 25.0, top: 2.0),
                  //                 child: new Row(
                  //                   mainAxisSize: MainAxisSize.max,
                  //                   children: <Widget>[
                  //                     new Flexible(
                  //                       child: TextFormField(initialValue: myprofiledata.advName),
                  //                     ),
                  //                   ],
                  //                 )),
                  //             Padding(
                  //                 padding: EdgeInsets.only(
                  //                     left: 25.0, right: 25.0, top: 25.0),
                  //                 child: new Row(
                  //                   mainAxisSize: MainAxisSize.max,
                  //                   children: <Widget>[
                  //                     new Column(
                  //                       mainAxisAlignment: MainAxisAlignment.start,
                  //                       mainAxisSize: MainAxisSize.min,
                  //                       children: <Widget>[
                  //                         new Text(
                  //                           'Father Name',
                  //                           style: TextStyle(
                  //                               fontSize: 16.0,
                  //                               fontWeight: FontWeight.bold),
                  //                         ),
                  //                       ],
                  //                     ),
                  //                   ],
                  //                 )),
                  //             Padding(
                  //                 padding: EdgeInsets.only(
                  //                     left: 25.0, right: 25.0, top: 2.0),
                  //                 child: new Row(
                  //                   mainAxisSize: MainAxisSize.max,
                  //                   children: <Widget>[
                  //                     new Flexible(
                  //                       child:TextFormField(initialValue: myprofiledata.advFname),
                  //                     ),
                  //                   ],
                  //                 )),
                  //
                  //             Padding(
                  //                 padding: EdgeInsets.only(
                  //                     left: 25.0, right: 25.0, top: 25.0),
                  //                 child: new Row(
                  //                   mainAxisSize: MainAxisSize.max,
                  //                   children: <Widget>[
                  //                     new Column(
                  //                       mainAxisAlignment: MainAxisAlignment.start,
                  //                       mainAxisSize: MainAxisSize.min,
                  //                       children: <Widget>[
                  //                         new Text(
                  //                           'Gender',
                  //                           style: TextStyle(
                  //                               fontSize: 16.0,
                  //                               fontWeight: FontWeight.bold),
                  //                         ),
                  //                       ],
                  //                     ),
                  //                   ],
                  //                 )),
                  //             Padding(
                  //                 padding: EdgeInsets.only(
                  //                     left: 25.0, right: 25.0, top: 2.0),
                  //                 child: new Row(
                  //                   mainAxisSize: MainAxisSize.max,
                  //                   children: <Widget>[
                  //                     new Flexible(
                  //                       child:TextFormField(initialValue: myprofiledata.gender),
                  //                     ),
                  //                   ],
                  //                 )),
                  //             Padding(
                  //                 padding: EdgeInsets.only(
                  //                     left: 25.0, right: 25.0, top: 25.0),
                  //                 child: new Row(
                  //                   mainAxisSize: MainAxisSize.max,
                  //                   mainAxisAlignment: MainAxisAlignment.start,
                  //                   children: <Widget>[
                  //                     Expanded(
                  //                       child: Container(
                  //                         child: new Text(
                  //                           'District',
                  //                           style: TextStyle(
                  //                               fontSize: 16.0,
                  //                               fontWeight: FontWeight.bold),
                  //                         ),
                  //                       ),
                  //                       flex: 2,
                  //                     ),
                  //                     Expanded(
                  //                       child: Container(
                  //                         child: new Text(
                  //                           'Division',
                  //                           style: TextStyle(
                  //                               fontSize: 16.0,
                  //                               fontWeight: FontWeight.bold),
                  //                         ),
                  //                       ),
                  //                       flex: 2,
                  //                     ),
                  //                   ],
                  //                 )),
                  //             Padding(
                  //                 padding: EdgeInsets.only(
                  //                     left: 25.0, right: 25.0, top: 2.0),
                  //                 child: new Row(
                  //                   mainAxisSize: MainAxisSize.max,
                  //                   mainAxisAlignment: MainAxisAlignment.start,
                  //                   children: <Widget>[
                  //                     Flexible(
                  //                       child: Padding(
                  //                         padding: EdgeInsets.only(right: 10.0),
                  //                         child: TextFormField(initialValue: myprofiledata.disName),
                  //                       ),
                  //                       flex: 2,
                  //                     ),
                  //                     Flexible(
                  //                       child: TextFormField(initialValue: myprofiledata.divName),
                  //                       flex: 2,
                  //                     ),
                  //                   ],
                  //                 )),
                  //             Padding(
                  //                 padding: EdgeInsets.only(
                  //                     left: 25.0, right: 25.0, top: 25.0),
                  //                 child: new Row(
                  //                   mainAxisSize: MainAxisSize.max,
                  //                   children: <Widget>[
                  //                     new Column(
                  //                       mainAxisAlignment: MainAxisAlignment.start,
                  //                       mainAxisSize: MainAxisSize.min,
                  //                       children: <Widget>[
                  //                         new Text(
                  //                           'Date Of Birth',
                  //                           style: TextStyle(
                  //                               fontSize: 16.0,
                  //                               fontWeight: FontWeight.bold),
                  //                         ),
                  //                       ],
                  //                     ),
                  //                   ],
                  //                 )),
                  //             Padding(
                  //                 padding: EdgeInsets.only(
                  //                     left: 25.0, right: 25.0, top: 2.0),
                  //                 child: new Row(
                  //                   mainAxisSize: MainAxisSize.max,
                  //                   children: <Widget>[
                  //                     new Flexible(
                  //                       child:TextFormField(initialValue: myprofiledata.dob.toString()),
                  //                     ),
                  //                   ],
                  //                 )),
                  //             Padding(
                  //                 padding: EdgeInsets.only(
                  //                     left: 25.0, right: 25.0, top: 25.0),
                  //                 child: new Row(
                  //                   mainAxisSize: MainAxisSize.max,
                  //                   children: <Widget>[
                  //                     new Column(
                  //                       mainAxisAlignment: MainAxisAlignment.start,
                  //                       mainAxisSize: MainAxisSize.min,
                  //                       children: <Widget>[
                  //                         new Text(
                  //                           'Enroll Type',
                  //                           style: TextStyle(
                  //                               fontSize: 16.0,
                  //                               fontWeight: FontWeight.bold),
                  //                         ),
                  //                       ],
                  //                     ),
                  //                   ],
                  //                 )),
                  //             Padding(
                  //                 padding: EdgeInsets.only(
                  //                     left: 25.0, right: 25.0, top: 2.0),
                  //                 child: new Row(
                  //                   mainAxisSize: MainAxisSize.max,
                  //                   children: <Widget>[
                  //                     new Flexible(
                  //                       child:TextFormField(initialValue: myprofiledata.enrollType),
                  //                     ),
                  //                   ],
                  //                 )),
                  //
                  //             Padding(
                  //                 padding: EdgeInsets.only(
                  //                     left: 25.0, right: 25.0, top: 25.0),
                  //                 child: new Row(
                  //                   mainAxisSize: MainAxisSize.max,
                  //                   mainAxisAlignment: MainAxisAlignment.start,
                  //                   children: <Widget>[
                  //                     Expanded(
                  //                       child: Container(
                  //                         child: new Text(
                  //                           'Enroll Lower Court',
                  //                           style: TextStyle(
                  //                               fontSize: 16.0,
                  //                               fontWeight: FontWeight.bold),
                  //                         ),
                  //                       ),
                  //                       flex: 2,
                  //                     ),
                  //                     Expanded(
                  //                       child: Container(
                  //                         child: new Text(
                  //                           'Enroll High Court',
                  //                           style: TextStyle(
                  //                               fontSize: 16.0,
                  //                               fontWeight: FontWeight.bold),
                  //                         ),
                  //                       ),
                  //                       flex: 2,
                  //                     ),
                  //                   ],
                  //                 )),
                  //             Padding(
                  //                 padding: EdgeInsets.only(
                  //                     left: 25.0, right: 25.0, top: 2.0),
                  //                 child: new Row(
                  //                   mainAxisSize: MainAxisSize.max,
                  //                   mainAxisAlignment: MainAxisAlignment.start,
                  //                   children: <Widget>[
                  //                     Flexible(
                  //                       child: Padding(
                  //                         padding: EdgeInsets.only(right: 10.0),
                  //                         child: TextFormField(initialValue: myprofiledata.enrollLcDate),
                  //                       ),
                  //                       flex: 2,
                  //                     ),
                  //                     Flexible(
                  //                       child: TextFormField(initialValue: myprofiledata.enrollHcDate),
                  //                       flex: 2,
                  //                     ),
                  //                   ],
                  //                 )),
                  //             Padding(
                  //                 padding: EdgeInsets.only(
                  //                     left: 25.0, right: 25.0, top: 25.0),
                  //                 child: new Row(
                  //                   mainAxisSize: MainAxisSize.max,
                  //                   children: <Widget>[
                  //                     new Column(
                  //                       mainAxisAlignment: MainAxisAlignment.start,
                  //                       mainAxisSize: MainAxisSize.min,
                  //                       children: <Widget>[
                  //                         new Text(
                  //                           'Status',
                  //                           style: TextStyle(
                  //                               fontSize: 16.0,
                  //                               fontWeight: FontWeight.bold),
                  //                         ),
                  //                       ],
                  //                     ),
                  //                   ],
                  //                 )),
                  //             Padding(
                  //                 padding: EdgeInsets.only(
                  //                     left: 25.0, right: 25.0, top: 2.0),
                  //                 child: new Row(
                  //                   mainAxisSize: MainAxisSize.max,
                  //                   children: <Widget>[
                  //                     new Flexible(
                  //                       child:TextFormField(initialValue: myprofiledata.status),
                  //                     ),
                  //                   ],
                  //                 )),
                  //
                  //
                  //
                  //
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ],
          ),
        ));
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

  // void getdata() {
  //   gettaskfuture =  myprofile().then((value) {
  //     myprofiledata = value;
  //     setState(() {
  //       flag = false;
  //     });
  //   });
  // }
}

class MyClipper  extends CustomClipper<Path> {
  @override
  // Path getClip(Size size) {
  //   var path = new Path();
  //   path.lineTo(0, size.height - 40);
  //   var controllPoint = Offset(10,size.height);
  //   var endPoint = Offset(size.width / 5, size.height);
  //   path.quadraticBezierTo(controllPoint.dx, controllPoint.dy, endPoint.dx, endPoint.dy);
  //   path.lineTo(size.width, size.height);
  //   path.lineTo(size.width, 0);
  //   return path;
  // }
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 40);

    var firstControlPoint = Offset(size.width / 100, size.height);
    var firstPoint = Offset(size.width / 3, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstPoint.dx, firstPoint.dy);

    var secondControlPoint = Offset(size.width - (size.width/100), size.height);
    var secondPoint = Offset(size.width, size.height -40);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondPoint.dx, secondPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }


  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
class MyClipper2  extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 40);

    var firstControlPoint = Offset(size.width, size.height);
    var firstPoint = Offset(size.width, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstPoint.dx, firstPoint.dy);



    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }


  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}