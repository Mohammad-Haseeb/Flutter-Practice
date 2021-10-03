import 'package:admin_virtual_book_store/Controller/person.dart';
import 'package:admin_virtual_book_store/Controller/paymentcard.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:admin_virtual_book_store/Controller/logininterface.dart';
// implements Login
class Seller extends Person  {
  late PaymentCard _paymentCard;
  late String _Shopname;
  String? loginemail;
  String? loginpassword;
  String? _uid;
  late Map<String, String> _shopTime;

  String?  getUid(){
    return  _uid.toString();
  }

  void setUid(String value) {
    _uid = value;
  }


  Seller() : super.named() {
    print("String Seller");
  }


  set Shopname(String value) {
    _Shopname = value;
  }


  Future<bool> loginVerification(String email, String pass) async{
     print("Hello First");
     try {
       FirebaseAuth auth = FirebaseAuth.instance;
       final String userID=email;
       final String password=pass;
       UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
         email: userID,
         password: password,
       );
       setUid(userCredential.user.uid);
       print(userCredential.user.uid);
       print("Hello");
       return true;

     } on FirebaseAuthException catch (e) {
       if (e.code == 'user-not-found') {
         // return 'No user found for that email.';
         return false;
       } else if (e.code == 'wrong-password') {
         // print('Wrong password provided for that user.');
         return false;
       }
     }
     return false;
   }
  bool statusCheck(){return false;}

  Map<String, String> get shopTime => _shopTime;



  PaymentCard get paymentCard => _paymentCard;

  String get Shopname => _Shopname;

  void setPaymentCard(
      String paymentCardNumber, int cvc, String expiryDate, String holderName) {
    _paymentCard = PaymentCard(paymentCardNumber, cvc, expiryDate, holderName);
  }

  set shopTime(Map<String, String> value) {
    _shopTime = value;
  }

  Future<String> sendData() async {
    try {
      print("OH");
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: super.getEmail().toString(),
        password: super.getPassword(),
      );
      print("ID CHECKE ARE AUTH ${userCredential.user.uid}");
      CollectionReference users =
         await  FirebaseFirestore.instance.collection('Admin_Users_Registration_Data');
      users.doc(userCredential.user.uid).set({
        "full_name": super.name,
        "phone_Number": super.getphoneNumber(),
        "email": super.getEmail(),
        "address": super.getAddress(),
        "status": super.getStatus(),
        "ShopInfo": {"shop_name": this.Shopname, "shop_time": this.shopTime},
        "PaymentInfo": {
          "card_number": this.paymentCard.paymentCardNumber,
          "cvv": this.paymentCard.cvc,
          "ExpiryDate": this.paymentCard.expiryDate,
          "card_holdername": this.paymentCard.holderName
        }
      });
      print("ID CHECKE AFTER Registration ${users.id}");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }

    // return 'User ${super.getEmail()}   ${super.getPassword()}  ${super.getAddress()} ${super.getphoneNumber()}  ${super.getpayment()} Yo  ${super.name}    "   :  "    CardName ${this.paymentCard.holderName} , CardNumber ${this.paymentCard.paymentCardNumber} , CardExpiry ${this.paymentCard.expiryDate} cvv  ${this.paymentCard.cvc}';
    return this.shopTime['end'].toString();
  }
}
