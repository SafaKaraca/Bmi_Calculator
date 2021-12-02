import 'package:flutter/material.dart';

const bottomContainerHeight = 80.0;
const activeContainerColor = Color(0xFF1D1E33);
const bottomContainerColor = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
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
                  child: ReusableContainer(colour: activeContainerColor),
                ),
                Expanded(
                  child: ReusableContainer(colour: activeContainerColor),
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

class ReusableContainer extends StatelessWidget {
  ReusableContainer({required this.colour});

  final Color colour;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      decoration:
          BoxDecoration(color: colour, borderRadius: BorderRadius.circular(10)),
    );
  }
}
