import 'package:bmi_app/OutputScreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'constants.dart';
import 'BMI_brain.dart';

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
  double heightUser = 180;
  int weightUser = 60;
  int userAge = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
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
                    children: <Widget>[
                      Text(
                        heightUser.toString(),
                        style: kCardNumbers,
                      ),
                      const Text(
                        'cm',
                        style: kLableTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: const RoundSliderThumbShape(
                        enabledThumbRadius: 15,
                      ),
                      overlayShape: const RoundSliderOverlayShape(
                        overlayRadius: 30,
                      ),
                    ),
                    child: Slider(
                      onChanged: (double newValue) {
                        setState(() {
                          heightUser = newValue.roundToDouble();
                        });
                      },
                      value: heightUser.toDouble(),
                      min: kUserMinHeight,
                      max: kUserMaxHeight,
                      activeColor: Colors.white,
                      thumbColor: kSliderActive,
                      inactiveColor: kSliderInactive,
                      overlayColor:
                          const MaterialStatePropertyAll(kSliderOverlay),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    rang: kActive,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'WEIGHT',
                          style: kLableTextStyle,
                        ),
                        Text(
                          weightUser.toString(),
                          style: kCardNumbers,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            IconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weightUser--;
                                });
                              },
                            ),
                            IconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weightUser++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'AGE',
                          style: kLableTextStyle,
                        ),
                        Text(
                          userAge.toString(),
                          style: kCardNumbers,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  userAge--;
                                });
                              },
                              icon: FontAwesomeIcons.minus,
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  userAge++;
                                });
                              },
                              icon: FontAwesomeIcons.plus,
                            ),
                          ],
                        ),
                      ],
                    ),
                    rang: kActive,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain cal =
                  CalculatorBrain(height: heightUser, weight: weightUser);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                      bmiResult: cal.calculateBMI(),
                      interpretation: cal.interpretation(),
                      resultText: cal.getResult()),
                ),
              );
            },
            child: Container(
              color: const Color(0xFFEB1555),
              margin: const EdgeInsets.only(top: 10),
              width: double.infinity,
              height: 80,
              padding: const EdgeInsets.only(bottom: 20),
              child: const Center(
                child: Text(
                  'CALCULATE',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class IconButton extends StatelessWidget {
  const IconButton({Key? key, this.icon, required this.onPressed})
      : super(key: key);
  final IconData? icon;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 6,
      shape: const CircleBorder(),
      fillColor: kIconButton,
      constraints: const BoxConstraints.tightFor(
        height: 56,
        width: 56,
      ),
      child: Icon(icon),
    );
  }
}
