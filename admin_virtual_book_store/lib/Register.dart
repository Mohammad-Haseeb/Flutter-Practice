import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController userNameController= TextEditingController();
  final TextEditingController passowrdController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        child: SafeArea(
          child: Column(
            children: [
              TextFormField(
                controller: userNameController,
                decoration: InputDecoration(
                  labelText: "Enter email"
                ),
              ),
              TextFormField(
                controller: passowrdController,
                decoration: InputDecoration(
                    labelText: "Enter Password"
                ),
              ),
              ElevatedButton(onPressed: () async{
                       FirebaseAuth auth=FirebaseAuth.instance;
                      print(userNameController.text);
                        print(passowrdController.text);
                        final String email=userNameController.text;
                        final String password=passowrdController.text;
                        try{
                          await FirebaseAuth.instance.createUserWithEmailAndPassword(
                              email: userNameController.text.toString(),
                              password: passowrdController.text.toString()
                          );
                        }catch(e){

                           print(e);
                        }
              }, child: Text("Submit"))
            ],
          ),
        ),
      ),

    );
  }
}
