import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_container.dart';
import 'constants.dart';

//Input page

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
  Gender? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  //Checks whether tabbed or not
                  child: ReusableContainer(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    //Comes from reusable_container fart file
                    colour: selectedGender == Gender.male
                        ? kActiveContainerColor
                        : kInactiveContainerColor,
                    //Ternary operator, comes from enum
                    cardChild: IconContent(
                      //Icon of card
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableContainer(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kActiveContainerColor
                        : kInactiveContainerColor,
                    //Ternary operator, comes from enum
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
            child: ReusableContainer(
              colour: kActiveContainerColor,
              cardChild: Column(
                children: [
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: ReusableContainer(colour: kActiveContainerColor),
              ),
              Expanded(
                child: ReusableContainer(colour: kActiveContainerColor),
              ),
            ],
          )),
          Container(
            //The bottom card
            color: kBottomContainerColor,
            margin: EdgeInsets.only(top: 10),
            width: double.infinity, // Card goes to infinity
            height: kBottomContainerHeight,
          )
        ],
      ),
    );
  }
}
