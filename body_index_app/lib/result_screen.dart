import 'package:flutter/material.dart';
import 'reusable.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BMI"),
        ),
        body: Column(
          children: [
            const Expanded(
              flex: 1,
              child: Text(
                "Your Result Screen",
                style: TextStyle(
                    fontSize: 30.0, fontFamily: 'sans-serif-condensed'),
              ),
            ),
            Expanded(
                flex: 5,
                child: Container(
                  color: const Color(0xFF111328),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Center(
                        child: Text("Over Weight",
                            style: TextStyle(
                                fontSize: 30.0,
                                fontFamily: 'sans-serif-condensed')),
                      ),
                      Center(
                        child: Text(
                          "26.0",
                          style: TextStyle(
                              fontSize: 30.0,
                              fontFamily: 'sans-serif-condensed'),
                        ),
                      ),
                      Center(
                        child: Text("Do Exercise Daily",
                            style: TextStyle(
                                fontSize: 30.0,
                                fontFamily: 'sans-serif-condensed')),
                      ),
                    ],
                  ),
                ))
          ],
        ));
  }
}
