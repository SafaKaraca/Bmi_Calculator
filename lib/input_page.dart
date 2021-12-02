import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_container.dart';

const bottomContainerHeight = 80.0;
const activeContainerColor = Color(0xFF1D1E33);
const inactiveContainerColor = Color(0xFF111328);
const bottomContainerColor = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleContainerColor = inactiveContainerColor;
  Color femaleContainerColor = inactiveContainerColor;

  //1=male, 2=female
  void updateColor(int gender) {
    if (gender == 1) {
      if (maleContainerColor == inactiveContainerColor) {
        maleContainerColor = activeContainerColor;
        femaleContainerColor = inactiveContainerColor;
      } else {
        maleContainerColor = inactiveContainerColor;
      }
    }
    if (gender == 2) {
      if (femaleContainerColor == inactiveContainerColor) {
        femaleContainerColor = activeContainerColor;
        maleContainerColor = inactiveContainerColor;
      } else {
        femaleContainerColor = inactiveContainerColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(1);
                      });
                    },
                    child: ReusableContainer(
                      colour: maleContainerColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(2);
                      });
                    },
                    child: ReusableContainer(
                      colour: femaleContainerColor,
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
            child: ReusableContainer(colour: activeContainerColor),
          ),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: ReusableContainer(colour: activeContainerColor),
              ),
              Expanded(
                child: ReusableContainer(colour: activeContainerColor),
              ),
            ],
          )),
          Container(
            color: bottomContainerColor,
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            height: bottomContainerHeight,
          )
        ],
      ),
    );
  }
}
