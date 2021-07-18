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
  int sliderValue = 120;
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
        ResuableCard(
            color: kActiveCardColour,
            childWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: const [
                    Text(
                      "180",
                      style:
                          TextStyle(fontSize: 38.0, color: Color(0xFF8D8E98)),
                    ),
                    Text("cm")
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      thumbColor: Colors.pink,
                      activeTrackColor: Colors.white,
                      overlayColor: Color(0x29EB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0)),
                  child: Slider(
                    value: sliderValue.toDouble(),
                    onChanged: (double newValue) {
                      setState(() {
                        sliderValue = newValue.round();
                      });
                    },
                    max: 220.0,
                    min: 120.0,
                  ),
                )
              ],
            )),
        ResuableCard(
          color: kActiveCardColour,
          childWidget: Row(
            children: [
              ResuableCard(
                color: kActiveCardColour,
                childWidget: Column(
                  children: [
                    const Text("Weight"),
                    const Text("300"),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RawMaterialBtn(icon: FontAwesomeIcons.plus,),
                          const SizedBox(
                            width: 10,
                          ),
                          RawMaterialBtn(icon: FontAwesomeIcons.minus,)
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 30.0,
              ),
              ResuableCard(
                color: kActiveCardColour,
                childWidget: Column(
                  children: [
                    const Text("Weight"),
                    const Text("300"),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RawMaterialBtn(icon: FontAwesomeIcons.plus,),
                          const SizedBox(
                            width: 10,
                          ),
                          RawMaterialBtn(icon: FontAwesomeIcons.minus,)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class RawMaterialBtn extends StatelessWidget {
  RawMaterialBtn({@required this.icon,this.pressed});
  final IconData? icon;
  final  VoidCallback? pressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed:pressed,
      child: Icon(icon,color: Colors.black,),
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      elevation: 30.0,
      fillColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    );
  }
}
