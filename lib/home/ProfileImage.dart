/**
 * Author: Mausam Rayamajhi
 * profile: https://github.com/mausamRayamajhi
 */

import 'package:flutter/material.dart';

import '../constants.dart';


class ProfileImage extends StatelessWidget {
  final double height, width;
  final String image;
  final Color color;
  ProfileImage(
      {this.height = 100.0, this.width = 100.0, this.color = primaryColor,this.image});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.red,
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.contain,
        ),
        border: Border.all(
          color: color,
          width: 3.0,
        ),
      ),
    );
  }
}
