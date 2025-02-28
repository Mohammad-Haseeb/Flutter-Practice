import 'package:flutter/material.dart';
import 'package:admin_virtual_book_store/Components/logo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:admin_virtual_book_store/Screens/prodcut/productfirstform.dart';
import 'package:admin_virtual_book_store/Screens/registration.dart';
import 'package:admin_virtual_book_store/Controller/main.dart';
import 'package:admin_virtual_book_store/Controller/seller.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController=TextEditingController();

  final passwordController=TextEditingController();
  final _formKey=GlobalKey<FormState>();


  bool _isObscure = true;
 void validation() async{

   if(_formKey.currentState!.validate()){
     print(emailController.text);
     print(passwordController.text);
     final email=emailController.text.toString();
     final password=passwordController.text.toString();
     Main.seller=Seller();
   final result= await Main.seller?.loginVerification(email,password);
   print("Result ${result}");
   Navigator.push(
       context,
       MaterialPageRoute(builder: (context) =>   addprodcutfirstform(),),
     );

   }

 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const  Text("Login"),),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 14.0),
            child: Column(
              children:  [

                   const Center(
                      child:Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: Logo(totalRdius: 100,),
                      ),
                    ),
                  const  SizedBox(
                     height: 50,
                   ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                       controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration:  const InputDecoration(

                            prefixIcon: Padding(
                              padding: EdgeInsetsDirectional.only(start: 12.0),
                              child:  Icon(Icons.email), // myIcon is a 48px-wide widget.
                            ),
                           hintText: "email : xyz@gmail.com",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
               const SizedBox(
                  height: 20,
                ),
        TextFormField(
                   keyboardType: TextInputType.visiblePassword,
             controller:passwordController,
                       obscureText: _isObscure,
                  decoration:InputDecoration(
                    hintText: "password",
                    border:OutlineInputBorder(),
                    prefixIcon: const  Padding(
                      padding:  EdgeInsetsDirectional.only(start: 12.0),
                      child:Icon(Icons.lock)
                    ),

                      suffixIcon: IconButton(
                          icon: Icon(
                              _isObscure ? Icons.visibility : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            },);
                          },),),
                  ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                     children:  [

                       Padding(
                         padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 08),
                         child: ElevatedButton(onPressed:validation
                             , child:const Text("Login")),
                       ),
                       Padding(
                         padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 08),
                         child: OutlinedButton(onPressed: (){
                           Navigator.push(
                             context,
                             MaterialPageRoute(builder: (context) => const RegistrationPageOne()),
                           );

                         }, child:const Text("Sign up")),
                       )
                     ],
                   )


              ],
            ),
          ),
        ),
      ),

    );
  }
}
