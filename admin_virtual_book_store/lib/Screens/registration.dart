import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:admin_virtual_book_store/Helpers/registration_page_constant.dart';
import 'package:admin_virtual_book_store/Components/passwordvisibilty.dart';
import 'package:admin_virtual_book_store/Screens/payment_registration.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:admin_virtual_book_store/Screens/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:admin_virtual_book_store/Controller/main.dart';
import 'package:admin_virtual_book_store/Controller/person.dart';
import 'package:admin_virtual_book_store/Controller/seller.dart';

class RegistrationPageOne extends StatefulWidget {
  const RegistrationPageOne({Key? key}) : super(key: key);

  @override
  _RegistrationPageOneState createState() => _RegistrationPageOneState();
}

class _RegistrationPageOneState extends State<RegistrationPageOne> {
  // FirebaseFirestore firestore = FirebaseFirestore.instance;

  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  bool _isObscure = true;
  void validate() async {
    if (_formKey.currentState!.validate()) {
      try {
        // UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        //     email: emailController.text.toString(),
        //     password: passwordController.text.toString(),
        // );
        // CollectionReference users = FirebaseFirestore.instance.collection('users');
        // users
        //     .doc(userCredential.user.uid)
        //     .set({
        //   'full_name': "Mary Jane",
        //   'age': 18
        // });
        Main.seller =Seller();
       Main.seller?.AllInfoSetter(nameController.text
           ,phoneNumberController.text,emailController.text,passwordController.text ,addressController.text);
        //
             print("oy ${Main.seller?.getphoneNumber()}");
        print('OY ${Main.seller?.getAddress()}');
        print("OY+ ${Main.seller?.getEmail()}");
        print('Hello  ${Main.seller?.getPassword()}');
            print('YO Name ${Main.seller?.name}');


        // 2222 4000 7000 0005
        //      print(Main.seller?.getPassword());
        // print("Checking"+Main.seller.getAddress());
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PaymentRegistration()),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
      // print(emailController.text);
      // print(addressController.text);
      // print(phoneNumberController.text);
      // print(nameController.text);
      // print(passwordController.text);
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) =>  MySample()),
      //  );

    } else {
      print("not");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registration Page"),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const Center(
                  child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "Virtual Book Store",
                  style: TextStyle(fontSize: 30, fontFamily: 'Droid Sans'),
                ),
              )),
              Form(
                autovalidateMode: AutovalidateMode.always,
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: KEmailValidator,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "email : xyz@gmail.com",
                          prefixIcon: Padding(
                            padding: EdgeInsetsDirectional.all(10),
                            child: Icon(Icons.email),
                          )),
                    ),
                    const Sizer(),
                    TextFormField(
                        controller: nameController,
                        validator: KNameValidator,
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "enter your name",
                            prefixIcon: Padding(
                                padding: EdgeInsetsDirectional.all(10),
                                child: Icon(Icons.person)))),
                    const Sizer(),
                    TextFormField(
                        controller: phoneNumberController,
                        validator: KPhoneNumberValidaor,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "enter phone number",
                            prefixIcon: Padding(
                                padding: EdgeInsetsDirectional.all(10),
                                child: Icon(Icons.phone)))),
                    const Sizer(),
                    TextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      validator: KPasswordValidator,
                      obscureText: _isObscure,
                      decoration: InputDecoration(
                        hintText: "password",
                        border: OutlineInputBorder(),
                        prefixIcon: const Padding(
                            padding: EdgeInsetsDirectional.only(start: 12.0),
                            child: Icon(Icons.lock)),
                        suffixIcon: IconButton(
                          icon: PasswordShowIcon(isObscure: _isObscure),
                          onPressed: () {
                            setState(
                              () {
                                _isObscure = !_isObscure;
                              },
                            );
                          },
                        ),
                      ),
                    ),

                    const Sizer(),
                    TextFormField(
                        controller: addressController,
                        validator: KAddressValidator,
                        keyboardType: TextInputType.streetAddress,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "enter your address",
                            prefixIcon: Padding(
                                padding: EdgeInsetsDirectional.all(10),
                                child: Icon(Icons.add_location)))),


                    const Sizer(),

                    ElevatedButton(
                        onPressed: validate, child: const Text("Next")),
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
