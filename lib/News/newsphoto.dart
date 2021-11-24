
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
       body: imageWithLoader(context,getimage),

    );
  }

   imageWithLoader(BuildContext context,String image) {
    return SingleChildScrollView(
      child: Stack(children: <Widget>[
      Center(child: CircularProgressIndicator()),
      Center(
      child: FadeInImage(
      placeholder: AssetImage('assets/images/downlaod.png'),
      image: NetworkImage(
            image
      ),
      width: MediaQuery.of(context).size.width,

      fit: BoxFit.contain),
      ),
      ]),
    );
  }
}
