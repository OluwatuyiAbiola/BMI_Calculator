import 'package:flutter/material.dart';


//the extracted widget for cards
class ReusableCard extends StatelessWidget {
  

  const ReusableCard({ required this.colour, required this.cardChild});

  final Color colour;
  //added a custom card property for the child cardChild
  final Widget cardChild;
  //an onpress function for our reusable card for the gesturedetector widget

  @override
  Widget build(BuildContext context) {
    return Container(
            margin: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: colour
    
            ),
            child: cardChild,
          );
  }
}