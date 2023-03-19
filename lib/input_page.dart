import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'constants.dart';

enum GenderChoice {
  male,
  female,
  nulll,
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderChoice? selectedGender;
  Color maleCardColor = kInactive;
  Color femaleCardColor = kInactive;
  int number = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                        onPress: () {
                          setState(() {
                            selectedGender = GenderChoice.female;
                          });
                        },
                        rang: selectedGender == GenderChoice.female
                            ? kActive
                            : kInactive,
                        cardChild: const IconContent(
                          genderText: 'FEMALE',
                          genderIcon: FontAwesomeIcons.venus,
                        )),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = GenderChoice.male;
                        });
                      },
                      rang: selectedGender == GenderChoice.male
                          ? kActive
                          : kInactive,
                      cardChild: const IconContent(
                        genderText: 'MALE',
                        genderIcon: FontAwesomeIcons.mars,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                rang: kActive,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'HEIGHT',
                      style: kLableTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: const <Widget>[
                        Text(
                          '180',
                          style: kCardNumbers,
                        ),
                        Text(
                          'cm',
                          style: kLableTextStyle,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: const <Widget>[
                  Expanded(
                    child: ReusableCard(
                      rang: kActive,
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      rang: kActive,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: const Color(0xFFEB1555),
              margin: const EdgeInsets.only(top: 10),
              width: double.infinity,
              height: 80,
            )
          ],
        ),
      ),
    );
  }
}
