import 'package:flutter/material.dart';

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
              children: const <Widget>[
                Expanded(
                  child:ReusableCard(
                    colour: Color(0xfff1d1e33),
                   ),
                ),
                Expanded(
                  child:ReusableCard(
                    colour: Color(0xfff1d1e33)
                  ),
                ),
              ],
            ),
            ),
          const Expanded(
            child:ReusableCard(
              colour: Color(0xfff1d1e33)
            ), 
            ),
          Expanded(
            child:Row(
              children: const <Widget>[
                Expanded(
                  child:ReusableCard(
                    colour: Color(0xfff1d1e33)
                  ),
                  ),
                Expanded(
                  child:ReusableCard(
                    colour: Color(0xfff1d1e33)
                  ),
                ),
              ],
            ),
          ),
        ],

      ),
      
    );
  }
}

class ReusableCard extends StatelessWidget {
  

  const ReusableCard({required this.colour});

  final Color colour;

  @override
  Widget build(BuildContext context) {
    return Container(
            margin: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: colour
            ),
          );
  }
}