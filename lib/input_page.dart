// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//importing both icon and card design from created modules
import 'Icon_content.dart';
import 'Reusable_card.dart';

//create a variable
const bottomContainerHeight = 80.0;
const activeCardColour = Color(0xff1d1e33);
const bottomContainerColour = Color(0xffeb1555);
const inactiveCardColour =  Color(0xff111328);

enum Gender{male, female}

class InputPage extends StatefulWidget {
  

  @override
  State<InputPage> createState() => _InputPageState();
}

//setting a variable for the active color
Color maleCardColor = inactiveCardColour;
Color femaleCardColor = inactiveCardColour;
//create a function (conditional) to show the color when either a male card or female card is pressed
void updateColour (Gender selectedGender){
  //1 == male and 2 ==  female
  if (selectedGender == Gender.male){
    if(maleCardColor == inactiveCardColour){
      maleCardColor = activeCardColour;
      femaleCardColor = inactiveCardColour;
    } else {
      maleCardColor = inactiveCardColour;
    }
  }
  if (selectedGender == Gender.female){
    if(femaleCardColor == inactiveCardColour){
      femaleCardColor = activeCardColour;
      maleCardColor = inactiveCardColour;
    } else {
      femaleCardColor = inactiveCardColour;
    }
  }
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
                  child:GestureDetector(
                    onTap: (){
                      setState(() {
                        updateColour(Gender.male);
                      });
                    },
                    child: ReusableCard(
                      colour: maleCardColor,
                      //extracted the column widget
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                     ),
                  ),
                ),
                Expanded(
                  child:GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColour(Gender.female);
                      });
                    },
                    child: ReusableCard(
                      colour: femaleCardColor,
                      //note the reusable class has two properties one for color and the other for cardchild
                      //cardChild has a class named icon content
                      //icon content has two properties icon and label
                       cardChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
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


