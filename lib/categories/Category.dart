
import 'package:flutter/material.dart';
import 'package:sindh_bar_council/home/home.dart';

class Category extends StatefulWidget {
  final String image, title;
  Category(this.title, this.image);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){



        switch(widget.title) {
          case 'My Profile': {
            navigatemethod(9,'My Profile');
          }
          break;

          case 'Dues Detail': {
            navigatemethod(10,'Dues Detail');
            //statements;
          }
          break;

          case 'News': {
            navigatemethod(11,'News');
            //statements;
          }
          break;

          case 'Messages': {
            // navigatemethod(3,'Messages');
            //statements;
          }
          break;


          case 'Notifications': {
            navigatemethod(12,'Notifications');
            //statements;
          }
          break;

          case 'Payment': {
             navigatemethod(13,'Payment');
            //statements;
          }
          break;
          case 'Biometric': {
            navigatemethod(14,'Biometric');
            //statements;
          }
          break;

          default: {
            //statements;
          }
          break;
        }



      },
      child: Card(
        margin: EdgeInsets.only(right: 10.0, bottom: 10.0),
        child: Container(
          height: 140.0,
          width: 130.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              widget.title != 'Load eSewa'
                  ? Image.asset(
                widget.image,
                height: 50.0,
                color: Colors.red[900],
              )
                  : Image.asset(
                widget.image,
                height: 40.0,
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                widget.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void navigatemethod(int i,String get) {

    Navigator. pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) =>Home_page(i,get),
      ),
          (route) => false,
    );
  }
}
