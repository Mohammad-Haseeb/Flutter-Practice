import 'package:admin_virtual_book_store/Controller/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:admin_virtual_book_store/Controller/main.dart';
class Stock {
  late Prodcut product;
  static Stock? stock;

  Prodcut add() {
    this.product=Prodcut();
   return this.product;
  }
  Prodcut getProdudct(){
    return this.product;
  }
  void SendData(){
    print(this.getProdudct().image);
  }

  static Stock?  createStock(){
       if(stock==null){
         stock=Stock();
       }
       return stock;
  }
}
