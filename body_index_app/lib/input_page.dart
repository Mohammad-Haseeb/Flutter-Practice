import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:body_index_app/reusable.dart';
import 'package:body_index_app/icon_content.dart';

const kActiveCardColour = Color(0xFF1D1E33);
const kInactiveCardColour = Color(0xFF111328);

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Row(
          children: [
            ResuableCard(color:  kActiveCardColour ,
                childWidget: IconsContent(icon: FontAwesomeIcons.male, label: "Male"),
              onPress: ()=>{
              print("Hello")
              },
            ),
            ResuableCard(color:  kActiveCardColour ,
              childWidget: IconsContent(icon: FontAwesomeIcons.female, label: "Female"),
              onPress: ()=>{
                print("Hello")
              },
            ),

          ],
        )),
        ResuableCard(color:  kActiveCardColour ),
        ResuableCard(color:  kActiveCardColour )



      ],
    );
  }
}

