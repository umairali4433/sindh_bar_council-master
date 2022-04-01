import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Aboutus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(8),
    child: Card(

      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset('assets/images/chairman.jpeg',height: MediaQuery.of(context).size.height*0.3,),
            SizedBox(height: 20,),
            Text('Arif Dawood Member and Chairman Sbc',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 18,color: Colors.green)),
            Expanded(
              child: Text(
                '\n Sahulat App is designed and developed with the support of Arif Dawood, Member and chairman SBC.\n\n The main objective behind the creation of this application is to provide ease and comfort to the members as well as to keep them updated with all the notifications and updates from the bar council. The app is available on both android and iOS platform.\n\n "I wanted to create a platform where the members of council can stay connected and able to perform different functions with click of a button"- Arif Dawood Chairman Executive Sindh Bar council 2021.',
                overflow: TextOverflow.clip,
                style: TextStyle(fontWeight:FontWeight.bold,fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }
}
