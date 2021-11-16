/**
 * Author: Mausam Rayamajhi
 * profile: https://github.com/mausamRayamajhi
 */


import 'package:flutter/material.dart';

import '../constants.dart';
import 'Category.dart';
import 'Heading.dart';


class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          height: 10.0,
        ),
        Heading(
          'Please make a selection',
        ),
        SizedBox(
          height: 25.0,
        ),
        Flexible(
          fit: FlexFit.loose,
          child: GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            // primary: true,
            children: categories
                .map((item) => Category(
              item['title'],
               item['image'],
            ))
                .toList(),
          ),
        ),
      ],
    );
  }
}
