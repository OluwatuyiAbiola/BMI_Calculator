// ignore_for_file: prefer_const_constructors

import 'package:bmi_calculator/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//importing both icon and card design from created modules
import 'package:bmi_calculator/components/Icon_content.dart';
import 'package:bmi_calculator/components/Reusable_card.dart';
import '../constant.dart';
import 'result_page.dart';
import 'package:bmi_calculator/calculator_brain.dart';
//create a variable


enum Gender{male, female}

class InputPage extends StatefulWidget {
  

  @override
  State<InputPage> createState() => _InputPageState();
}
  Gender? selectedGender;

  int height = 180;
  int weight = 60;
  int age = 20;



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
                  child:GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: ReusableCard(
                      // onPress: (){
                      //   setState(() {
                      //     selectedGender = Gender.male;
                      //   });
                      // },
                      colour: selectedGender == Gender.male ? kActiveCardColour : kInactiveCardColour,
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
                        selectedGender = Gender.female;
                      });
                    },
                    child: ReusableCard(
                      // onPress: (){
                      //   setState(() {
                      //     selectedGender = Gender.female;
                      //   });
                      // },
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
                  SliderTheme(
                    //you can copy the slider theme to d theme data in main.dart from here
                    data: SliderTheme.of(context).copyWith(
                      inactiveTickMarkColor: Color(0xff8d8e98),
                      activeTrackColor: Colors.white,
                      overlayColor: Color(0x29eb1555),
                      thumbColor: Color(0xffeb1555),
                      thumbShape:
                       RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                       RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height =  newValue.round();
                        });
                      }
                    ),
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
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RawMaterialButton(
                              onPressed: (){
                                setState(() {
                                  weight--;
                                });
                              },
                              
                              elevation: 6.0,
                              constraints: BoxConstraints.tightFor(
                                width: 56.0,
                                height: 56.0,
                              ),
                              shape: CircleBorder(),
                              fillColor: Color(0xff4c4f54),
                              child: Icon(FontAwesomeIcons.minus),
                            ),
                            // RoundIconButton(
                            //   icon: FontAwesomeIcons.minus,
                            //   onPressed: (){
                            //     setState(() {
                            //       weight--;
                            //     });
                            //   },
                            // ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RawMaterialButton(
                                onPressed: (){
                                setState(() {
                                  weight++;
                                });
                              },
                              
                              elevation: 6.0,
                              constraints: BoxConstraints.tightFor(
                                width: 56.0,
                                height: 56.0,
                              ),
                              shape: CircleBorder(),
                              fillColor: Color(0xff4c4f54),
                              child: Icon(FontAwesomeIcons.plus),
                            )
                            // RoundIconButton(
                            //   icon: FontAwesomeIcons.plus,
                            //   onPressed: (){
                            //     setState(() {
                            //       weight++;
                            //     });
                            //   },
                            // )
                          ],
                        )
                      ],
                    ),
                  ),
                  ),
                Expanded(
                  child:ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RawMaterialButton(
                              onPressed: (){
                                setState(() {
                                  age--;
                                });
                              },
                              
                              elevation: 6.0,
                              constraints: BoxConstraints.tightFor(
                                width: 56.0,
                                height: 56.0,
                              ),
                              shape: CircleBorder(),
                              fillColor: Color(0xff4c4f54),
                              child: Icon(FontAwesomeIcons.minus),
                            ),
                            // RoundIconButton(
                            //   icon: FontAwesomeIcons.minus,
                            //   onPressed: (){
                            //     setState(() {
                            //       age--;
                            //     });
                            //   },
                            // ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RawMaterialButton(
                                onPressed: (){
                                setState(() {
                                  age++;
                                });
                              },
                              
                              elevation: 6.0,
                              constraints: BoxConstraints.tightFor(
                                width: 56.0,
                                height: 56.0,
                              ),
                              shape: CircleBorder(),
                              fillColor: Color(0xff4c4f54),
                              child: Icon(FontAwesomeIcons.plus),
                            )
                            // RoundIconButton(
                            //   icon: FontAwesomeIcons.plus,
                            //   onPressed: (){
                            //     setState(() {
                            //       age++;
                            //     });
                            //   },
                            // )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap:(){
              CalculatorBrain calc =
               CalculatorBrain(height:height , weight:weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => ResultPage(
                    bmiResult: calc.calculateBMI(),
                    interpretation: calc.getResult(), 
                    resultText: calc.getInterpretation(),
                  )
                )
              )
              );
            },
            child: Container(
              color: kBottomContainerColour,
              // margin: EdgeInsets.only(top: 10.0),
              padding: EdgeInsets.only(bottom: 10.0),
              width: double.infinity,
              height: kBottomContainerHeight,
              child: Center(
                child: Text(
                  'CALCULATE',
                  style: kLargeButtonTextStyle,
                ),
              ),
            ),
          )
        ],

      ),
      
    );
  }
}


// class RoundIconButton extends StatelessWidget {
//   const RoundIconButton({required this.icon, required this.onPressed});

//   final IconData icon;
//   final Function onPressed;

//   @override
//   Widget build(BuildContext context) {
    
//     return RawMaterialButton(
//       onPressed: onPressed(),
      
//       elevation: 6.0,
//       constraints: BoxConstraints.tightFor(
//         width: 56.0,
//         height: 56.0,
//       ),
//       shape: CircleBorder(),
//       fillColor: Color(0xff4c4f54),
//       child: Icon(icon),
//     );
//   }
// }

