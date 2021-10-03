import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:admin_virtual_book_store/Components/logo.dart';
import 'package:admin_virtual_book_store/Screens/login.dart';
import 'package:admin_virtual_book_store/Screens/registration.dart';
import 'package:admin_virtual_book_store/Components/custombutton.dart';
class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(child:Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:   [
           const Center(
             child: Logo(totalRdius: 150,),
           ),

            Column(
              children:  [
                CustomButton(title: "Login",pressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                  );
                },),
               const SizedBox(height:15,),
                CustomButton(title: "Sign Up",pressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RegistrationPageOne()),
                  );
                },)
              ],
            )


          ],
        ),

      ))
    );
  }
}

