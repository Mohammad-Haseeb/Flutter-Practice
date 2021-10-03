import 'dart:io' ;

import 'package:admin_virtual_book_store/Controller/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:admin_virtual_book_store/Controller/main.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Stock {
  late Prodcut product;
  static Stock? stock;
  late String imageURL;

  Prodcut getProdcutObject() {
    this.product=Prodcut();
   return this.product;
  }
  Prodcut getProdudct(){
    return this.product;
  }

  Future<void> ImageStorage() async{
    try {
      File file = File(getProdudct().image);
      String fileName = file.path.split('/').last;
      firebase_storage.Reference ref =
          await firebase_storage.FirebaseStorage.instance.ref('/${fileName}');
      print("File ${file}");
      await ref.putFile(file);
       getProdudct().image=await ref.getDownloadURL();
    } catch (e) {
      print(e);
    }

  }

  void updateProduct({String? documentID})async{
    CollectionReference users =
    await  FirebaseFirestore.instance.collection('booksData');

    print(documentID);
    print(getProdudct().name);
    dynamic data=getProdudct();
       if(data.image.contains("https")==false){
         await ImageStorage();

       }



    print({
      "Product_Owner" : data.OwnerId,
      "ImageURL":data.image,
      "Product_Name":data.name,
      "Description":data.description,
      "Product_Prize":data.prize,
      "Total_Books":data.totalBooksAvailable,
      "Remaining_Books":data.remaingBooksLot,
      "Online_Availability":data.onlineAvailabilty,
      "Category":data.Category,
      "reviews":data.reviews
    });
    await users.doc(documentID).set(
        productFullData()
    );
  }


  Future<String> SendData() async{
      await ImageStorage();
    CollectionReference users =
   await  FirebaseFirestore.instance.collection('booksData');
    await  users.add(
      productFullData()
    );
    return "Product_Owner" + getProdudct().OwnerId ;
  }

 Map<String,dynamic> productFullData(){
    dynamic data=getProdudct();
    return {
      "Product_Owner" : data.OwnerId,
      "ImageURL":data.image.toString(),
      "Product_Name":data.name,
      "Description":data.description,
      "Product_Prize":data.prize,
      "Total_Books":data.totalBooksAvailable,
      "Remaining_Books":data.remaingBooksLot,
      "Online_Availability":data.onlineAvailabilty,
      "Category":data.Category,
      "reviews":data.reviews
    };
  }

  static Stock?  createStock(){
       if(stock==null){
         stock=Stock();
       }
       return stock;
  }
}
