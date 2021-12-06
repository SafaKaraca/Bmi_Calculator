import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_container.dart';


//Input page

const bottomContainerHeight = 80.0;
const activeContainerColor = Color(0xFF1D1E33); //Picked card color
const inactiveContainerColor = Color(0xFF111328); //Unpicked card color
const bottomContainerColor = Color(0xFFEB1555);

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

//Changes cards color when tabbed

class _InputPageState extends State<InputPage> {
  Color maleContainerColor = inactiveContainerColor;
  Color femaleContainerColor = inactiveContainerColor;

  //1=male, 2=female
  void updateColor(Gender selectedGender) {
    if (selectedGender == Gender.male) {
      if (maleContainerColor == inactiveContainerColor) {
        maleContainerColor = activeContainerColor;
        femaleContainerColor = inactiveContainerColor;
      } else {
        maleContainerColor = inactiveContainerColor;
      }
    }
    if (selectedGender == Gender.female) {
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
                  //Checks whether tabbed or not
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(Gender.male); //updates color
                      });
                    },
                    child: ReusableContainer( //Comes from reusable_container fart file
                    colour: maleContainerColor,
                      cardChild: IconContent( //Icon of card
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
                        updateColor(Gender.female);
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
          Container( //The bottom card
            color: bottomContainerColor,
            margin: EdgeInsets.only(top: 10),
            width: double.infinity, // Card goes to infinity
            height: bottomContainerHeight,
          )
        ],
      ),
    );
  }
}
