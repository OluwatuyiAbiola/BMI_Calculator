// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//importing both icon and card design from created modules
import 'Icon_content.dart';
import 'Reusable_card.dart';
import 'constant.dart';

//create a variable


enum Gender{male, female}

class InputPage extends StatefulWidget {
  

  @override
  State<InputPage> createState() => _InputPageState();
}
  Gender? selectedGender;

  int height = 180;



class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child:Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
                Expanded(
                  child:ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male ? kActiveCardColour : kInactiveCardColour,
                    //extracted the column widget
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                   ),
                ),
                Expanded(
                  child:ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female ? kActiveCardColour : kInactiveCardColour,
                    //note the reusable class has two properties one for color and the other for cardchild
                    //cardChild has a class named icon content
                    //icon content has two properties icon and label
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
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    activeColor: Color(0xFFEB1555),
                    inactiveColor: Color(0xff8d8e98),
                    onChanged: (double newValue) {
                      setState(() {
                        height =  newValue.round();
                      });
                    }
                  )
                ],
              ),
            ), 
            ),
          Expanded(
            child:Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
                Expanded(
                  //extracted a widget for cards
                  child:ReusableCard(
                    colour: kActiveCardColour,
                  ),
                  ),
                Expanded(
                  child:ReusableCard(
                    colour: kActiveCardColour,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: kBottomContainerColour,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: kBottomContainerHeight,
          )
        ],

      ),
      
    );
  }
}


