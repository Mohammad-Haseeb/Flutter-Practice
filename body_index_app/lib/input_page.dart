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
  int sliderValue=120;
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
        ResuableCard(color: kActiveCardColour,childWidget:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: const [
                Text("180",style:   TextStyle(fontSize: 38.0, color: Color(0xFF8D8E98)),),
                Text("cm")
              ],
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                thumbColor: Colors.pink,
                activeTrackColor: Colors.white,
                overlayColor: Color(0x29EB1555),
                 thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)

              ),
              child: Slider(value: sliderValue.toDouble(), onChanged: (double  newValue){
                setState(() {
                  sliderValue=newValue.round();
                });

              },
              max: 220.0,
              min: 120.0,


              ),
            )

          ],
        )),
        ResuableCard(color: kActiveCardColour)
      ],
    );
  }
}
