// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//create a variable
const bottomContainerHeight = 80.0;
const activeCardColour = Color(0xff1d1e33);
const bottomContainerColour = Color(0xffeb1555);

class InputPage extends StatefulWidget {
  

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child:Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
                Expanded(
                  child:ReusableCard(
                    colour: activeCardColour,
                    //extracted the column widget
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                   ),
                ),
                Expanded(
                  child:ReusableCard(
                    colour: activeCardColour,
                     cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
            ),
           Expanded(
            child:ReusableCard(
              colour: activeCardColour,
            ), 
            ),
          Expanded(
            child:Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
                Expanded(
                  //extracted a widget for cards
                  child:ReusableCard(
                    colour: activeCardColour,
                  ),
                  ),
                Expanded(
                  child:ReusableCard(
                    colour: activeCardColour,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: bottomContainerColour,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: bottomContainerHeight,
          )
        ],

      ),
      
    );
  }
}

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
      SizedBox(
        height: 15.0
        ),
      Text(
        //label property on the method
          label,
          style: TextStyle(
            fontSize: 18.0,
            color: Color(0xff8d8e98)
          ),
          )
      ]
    );
  }
}
//the extracted widget for cards
class ReusableCard extends StatelessWidget {
  

  const ReusableCard({ required this.colour, required this.cardChild});

  final Color colour;
  //added a custom card property for the child cardChild
  final Widget cardChild;

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