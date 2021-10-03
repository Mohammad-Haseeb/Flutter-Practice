import 'package:admin_virtual_book_store/Components/productimage.dart';
import 'package:admin_virtual_book_store/Controller/main.dart';
import 'package:admin_virtual_book_store/Controller/product.dart';
import 'package:admin_virtual_book_store/Screens/prodcut/productfirstform.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:slimy_card/slimy_card.dart';
import 'package:admin_virtual_book_store/Controller/stock.dart';
class CompleteProduct extends StatefulWidget {
  const CompleteProduct({Key? key,this.data, this.documentId}) : super(key: key);
  final String? documentId;
  final Map? data;

  @override
  _CompleteProductState createState() => _CompleteProductState();
}

class _CompleteProductState extends State<CompleteProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("Complete Info"),),
      body: Padding(
        padding: const EdgeInsets.only(top:4.0),
        child: SafeArea(

          child: ListView(
            children: <Widget>[
              SlimyCard(
                color: Theme.of(context).primaryColorLight,
                width: 400,
                topCardHeight: 450,
                bottomCardHeight: 100,
                borderRadius: 20,
                topCardWidget: Column(
                  children: [
                    ProductImages(data: widget.data,Width: 200,Height: 200,),

                   Text("Book Name ${widget.data!["Product_Name"]}"),
                    Text("Category : ${widget.data!["Category"]}"),
                    Text("Online Availability ${widget.data!["Online_Availability"]}"),
                    Text("Total Books For Sale ${widget.data!["Total_Books"]}"),
                    Text("Remaining Books For Sale ${widget.data!["Remaining_Books"]}"),



                  ],),
                bottomCardWidget: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    ElevatedButton(onPressed: (){
                      Main.stock=Stock.createStock();
                      Prodcut? product= Main.stock?.getProdcutObject();
                      product?.name=widget.data!["Product_Name"];
                      product?.image=widget.data!['ImageURL'];
                      print("OMG image checking ${product?.image}");
                      product?.OwnerId=widget.data!["Product_Owner"];
                      product?.description=widget.data!["Description"];
                      product?.prize=widget.data!["Product_Prize"];
                      product?.totalBooksAvailable=widget.data!["Total_Books"];
                      product?.remaingBooksLot=widget.data!["Remaining_Books"];
                      product?.onlineAvailabilty=widget.data!["Online_Availability"];
                      product?.Category=widget.data!["Category"];
                      product?.reviews=widget.data!['reviews'];
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>   addprodcutfirstform(statusOfRequest: false,documentId:widget.documentId , imageurl:widget.data!["ImageURL"]),),
                      );



                      Main.stock?.updateProduct();
                    }, child: Text("Update"),),
                    SizedBox(width: 19,),
                    TextButton(onPressed: (){}, child: Text("Delete"),),

                  ]
                ),
                slimeEnabled: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
