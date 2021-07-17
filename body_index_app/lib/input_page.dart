import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
            ResuableCard(color: Colors.lightBlue[800],
                childWidget: IconsContent(icon: FontAwesomeIcons.male, label: "Male"),),
            ResuableCard(color: Colors.lightBlue[800],
              childWidget: IconsContent(icon: FontAwesomeIcons.female, label: "Female"),),

          ],
        )),
        Expanded(child: Container(child: null,)),
        Expanded(child: Container(child: null,))


      ],
    );
  }
}

class ResuableCard extends StatelessWidget {
    ResuableCard({@required this.color, @required this.childWidget});
    final Color? color;
    final Widget? childWidget;
  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,

        ),
        child: childWidget,
        margin: EdgeInsets.all(05),
      ),
    );
  }
}

class IconsContent extends StatelessWidget {
       IconsContent({@required this.icon, @required this.label });
    final String? label;
    final IconData? icon;


  @override
  Widget build(BuildContext context) {
    return  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children :   <Widget>   [
          Icon(icon,size: 80,),
          SizedBox(height: 15,),
          Text(label.toString(),style: TextStyle(fontSize: 18.0,color: Color(0xFF8D8E98)),),


        ]

    ) ;
  }
}
