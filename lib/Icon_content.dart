import 'package:flutter/material.dart';
import 'constant.dart';



class IconContent extends StatelessWidget {

  //constructor for the object Iconcontent having icon and label properties
  const IconContent({required this.icon, required this.label});
  
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      // ignore: prefer_const_literals_to_create_immutables
      children: <Widget>[
        //icon property on the method
        Icon(icon),
      // ignore: prefer_const_constructors
      SizedBox(
        height: 15.0
        ),
      Text(
        //label property on the method
          label,
          //a const to rfer our style design to a point labelTextStyle
          style: kLabelTextStyle,
          )
      ]
    );
  }
}