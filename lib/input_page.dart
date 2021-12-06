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

  Gender? selectedGender;


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
                        selectedGender = Gender.male; //updates color
                      });
                    },
                    child: ReusableContainer( //Comes from reusable_container fart file
                    colour: selectedGender == Gender.male ? activeContainerColor : inactiveContainerColor, //Ternary operator, comes from enum
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
                        selectedGender = Gender.female;
                      });
                    },
                    child: ReusableContainer(
                      colour: selectedGender == Gender.female ? activeContainerColor : inactiveContainerColor, //Ternary operator, comes from enum
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
