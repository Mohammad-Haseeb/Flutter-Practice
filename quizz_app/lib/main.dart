import 'package:flutter/material.dart';
import 'QuestionsData.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuestionProvider questionProvider= QuestionProvider();

void main() {
  runApp(MaterialApp(
      home: Scaffold(
    appBar: AppBar(
      title: const Text("Quizz  App"),
      backgroundColor: Colors.cyan,
    ),
    backgroundColor: Colors.cyan[600],
    body: MyApp(),
  )));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {

  int questionNumber=0;
  List<Widget> iconsList=[];

  void questionIncrementor(bool value){
      if(questionProvider.questionResult(questionNumber)==true){
        iconsList.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
      }else{
   iconsList.add(Icon(
   Icons.close,
   color: Colors.red,
   ));
      }
       questionNumber++;
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Center(
                    child: Container(
                      child: Text(
                        questionProvider.questionSent(questionNumber),

                        style: const TextStyle(
                            color: Colors.greenAccent,
                            fontSize: 20,
                            fontFamily: 'OtomanopeeOne'),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.only(top: 100.0),
                child: Column(
                  children: [
                    FlatButton(
                      onPressed: () {
                         setState((){
                           questionIncrementor(false);
                           if(questionProvider.questionSent(questionNumber)=="empty"){
                             Alert(
                               context: context,
                               type: AlertType.success,
                               title: "Quizz End",
                               desc: "Thanks For Quizz",
                               buttons: [
                                 DialogButton(
                                   child: Text(
                                     "Restart",
                                     style: TextStyle(color: Colors.white, fontSize: 20),
                                   ),
                                   onPressed: () => {setState((){questionNumber=0;})},

                                   width: 120,
                                 )
                               ],
                             ).show();
                           }

                         });
                      },
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 30, horizontal: 100),
                        child: Text(
                          "True",
                          style: TextStyle(
                              fontSize: 30, fontFamily: 'San Francisco'),
                        ),
                      ),
                      color: Colors.orange,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FlatButton(
                      onPressed: () {
                        setState((){
                          questionIncrementor(true);
                          if(questionProvider.questionSent(questionNumber)=="empty"){
                            Alert(
                              context: context,
                              type: AlertType.error,
                              title: "Quizz End",
                              desc: "Thanks For  Quizz",
                              buttons: [
                                DialogButton(
                                  child: Text(
                                    "Restart",
                                    style: TextStyle(color: Colors.white, fontSize: 20),
                                  ),
                                  onPressed: () => {setState((){questionNumber=0;})
                                  },

                                  width: 120,
                                )
                              ],
                            ).show();
                          }

                        });

                      },
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 30, horizontal: 95),
                        child: Text(
                          "False",
                          style: TextStyle(
                              fontSize: 30, fontFamily: 'San Francisco'),
                        ),
                      ),
                      color: Colors.orange,
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children:iconsList
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
