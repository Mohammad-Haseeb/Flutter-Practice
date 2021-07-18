import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:body_index_app/reusable.dart';
import 'package:body_index_app/icon_content.dart';

const kActiveCardColour = Color(0xFF1D1E33);
const kInactiveCardColour = Color(0xFF111328);
enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Row(
          children: [
            ResuableCard(
              color: selectedGender == Gender.male
                  ? kActiveCardColour
                  : kInactiveCardColour,
              childWidget:
                  IconsContent(icon: FontAwesomeIcons.male, label: "Male"),
              onPress: () => {
                setState(() => {selectedGender = Gender.male})
              },
            ),
            ResuableCard(
              color: selectedGender == Gender.female
                  ? kActiveCardColour
                  : kInactiveCardColour,
              childWidget:
                  IconsContent(icon: FontAwesomeIcons.female, label: "Female"),
              onPress: () => {
                setState(() => {selectedGender = Gender.female})
              },
            ),
          ],
        )),
        ResuableCard(color: kActiveCardColour),
        ResuableCard(color: kActiveCardColour)
      ],
    );
  }
}
