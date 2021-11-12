
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Newsphoto extends StatelessWidget {
  String getimage;

  Newsphoto(this.getimage);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
      ),
       body: Container(
         width: MediaQuery.of(context).size.width,
           height: MediaQuery.of(context).size.height,
           decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(8.0),
      image: DecorationImage(
        image:imageWithLoader(context,getimage),
        fit: BoxFit.cover,
      ),
    ),
       ),

    );
  }

   imageWithLoader(BuildContext context,String image) {
    return Container(
  height: MediaQuery.of(context).size.height * 0.5,
  child: Stack(children: <Widget>[
  Center(child: CircularProgressIndicator()),
  Center(
  child: FadeInImage(
  placeholder: AssetImage('assets/images/logo.gif'),
  image: NetworkImage(
      image
  ),
  width: MediaQuery.of(context).size.width,
  fit: BoxFit.cover),
  ),
  ]));
  }
}
