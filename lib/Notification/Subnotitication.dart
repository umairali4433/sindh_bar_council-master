import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Subnotitication extends StatelessWidget {
  final String title,desciption;

  Subnotitication(this.title, this.desciption);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification'
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 8,
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
              hasScrollBody: false,
            child:Padding(
              padding: const EdgeInsets.only(top: 70,left: 8,right: 8,bottom: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/images/splashlogo.png'),
                  Text(title,style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                   SizedBox(height: 20,),
                  Text('Message:',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold)),
                  Expanded(
                    child: Text(
                      desciption,
                      overflow: TextOverflow.clip,
                    ),
                  ),

                ],
              ),
            )
              )
              ]
          ),
        ),
      ),
    );
  }
}
