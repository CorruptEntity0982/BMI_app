import 'package:flutter/material.dart';
import 'constants.dart';

class IconContent extends StatelessWidget {
  const IconContent(
      {super.key, required this.genderText, required this.genderIcon});
  final String genderText;
  final IconData genderIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          genderIcon,
          size: kGenderIconSize,
        ),
        const SizedBox(height: kGenderTextSize),
        Text(
          genderText,
          style: kLableTextStyle,
        ),
      ],
    );
  }
}
