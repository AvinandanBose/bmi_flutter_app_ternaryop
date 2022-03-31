import 'icon_content.dart';
import 'reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const bottomContainerHeight = 80.0;
const activeCardColor = Color(0xFF262A4B);
const inactiveCardColor = Color(0xFF111328);
const bottomContainerColor = Color(0xFFEB1555);
const appBackgroundColor = Color(0xFF0B102A);

enum Gender{
  male,
  female,
  noGender, //not needed if Gender? selectedGender; is used in the class.
}
class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
   Gender selectedGender = Gender.noGender; // or simply Gender? selectedGender;


 // Color maleCardColor = inactiveCardColor;
 // Color femaleCardColor = inactiveCardColor;

 // void updateColor(Gender selectedGender) {
 //   if (selectedGender == Gender.male) {
 //      if (maleCardColor == inactiveCardColor) {
 //        maleCardColor = activeCardColor;
 //        femaleCardColor = inactiveCardColor;
 //      } else {
 //        maleCardColor = inactiveCardColor;
 //      }
 //    }
 //    if (selectedGender == Gender.female) {
 //      if (femaleCardColor == inactiveCardColor) {
 //        femaleCardColor = activeCardColor;
 //        maleCardColor = inactiveCardColor;
 //      }
 //      else{
 //        femaleCardColor = inactiveCardColor;
 //      }
 //    }
 //  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBackgroundColor,
        title: const Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: ReusableCard(
                      colour: selectedGender == Gender.male ?activeCardColor :inactiveCardColor,
                      cardChild: const iconContent(
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
                    child: ReusableCard(
                      colour: selectedGender == Gender.female ?activeCardColor :inactiveCardColor,
                      cardChild: const iconContent(
                          icon: FontAwesomeIcons.venus, label: 'FEMALE'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Expanded(
            child: ReusableCard(
              colour: activeCardColor,
              cardChild:
              iconContent(icon: FontAwesomeIcons.venus, label: 'FEMALE'),
            ),
          ),
          Expanded(
            child: Row(
              children: const <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: activeCardColor,
                    cardChild: iconContent(
                        icon: FontAwesomeIcons.venus, label: 'FEMALE'),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: activeCardColor,
                    cardChild: iconContent(
                        icon: FontAwesomeIcons.venus, label: 'FEMALE'),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: bottomContainerColor,
            margin: const EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: bottomContainerHeight,
          )
        ],
      ),
    );
  }
}

/*
 Container(
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: const Color(0xFF1D1E33),
          borderRadius: BorderRadius.circular(10.0),
        ),
        height: 200.0,
        width: 170.0,
      ),
 */
