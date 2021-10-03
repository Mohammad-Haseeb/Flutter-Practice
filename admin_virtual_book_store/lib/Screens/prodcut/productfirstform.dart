import 'dart:io';

import 'package:flutter/material.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:image_picker/image_picker.dart';
import 'package:admin_virtual_book_store/Screens/prodcut/productdescription.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:admin_virtual_book_store/Controller/main.dart' ;
import 'package:admin_virtual_book_store/Controller/stock.dart';
import 'package:admin_virtual_book_store/Controller/product.dart';
import 'package:admin_virtual_book_store/Screens/drawer.dart';
class addprodcutfirstform extends StatefulWidget {

  addprodcutfirstform({this.statusOfRequest = true, this.documentId, this.imageurl});
  // status of request means Wethear we're updating data or adding new data
  final bool statusOfRequest;
  final String? documentId;
  final String? imageurl;
  @override
  _addprodcutfirstformState createState() => _addprodcutfirstformState();
}

class _addprodcutfirstformState extends State<addprodcutfirstform> {
  final _formKey = GlobalKey<FormState>();
  late String imagePath;


  final picker = ImagePicker();
  final bookNameController = TextEditingController(text: Main.stock?.getProdudct().name);
  final bookPrizeController = TextEditingController(text: Main.stock?.getProdudct().prize);
  final bookTotalQuanitityTextController = TextEditingController(text: Main.stock?.getProdudct().totalBooksAvailable);
  final bookCategoryController = TextEditingController(text: Main.stock?.getProdudct().Category);
  final bookOlineAvailabilityController = TextEditingController(text: Main.stock?.getProdudct().onlineAvailabilty.toString());

  String CategoryValue = 'Other';
  String AvaiabilityValue='True';
  void checker() async {


     Main.stock=Stock.createStock();

    Prodcut? product= Main.stock?.getProdcutObject();
             if(widget.statusOfRequest==false){
               print("State checker ${widget.statusOfRequest}");
               print("State checker of Mage ${widget.statusOfRequest}");
                imagePath=widget.imageurl.toString();

             }
            product?.name=bookNameController.text;
            product?.prize=bookPrizeController.text;
            product?.totalBooksAvailable=bookTotalQuanitityTextController.text;
             product?.Category=CategoryValue;
            product?.onlineAvailabilty=AvaiabilityValue == "True" ? true : false;
            print("Checking data UI of user in product ${Main.seller!.getUid().toString()}");
            product?.OwnerId=Main.seller!.getUid().toString();
            product?.image=imagePath;



     Navigator.push(
       context,
       MaterialPageRoute(builder: (context) =>    ProductDescriptionAndSubmit(statusOfRequest: widget.statusOfRequest,documentID:widget.documentId)),
     );
  }

  void getImage() async {
    final ImagePicker _picker = ImagePicker();
    final image = await _picker.getImage(source: ImageSource.gallery);
    setState(() {
      imagePath = image.path;
    });
    print('PICKER ${imagePath}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Product",),
      ),
      drawer:  myDrawer(title: "Hello"),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            children: [
              Form(
                autovalidateMode: AutovalidateMode.always,
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 70,
                    ),
                    TextFormField(
                      controller: bookNameController,
                      keyboardType: TextInputType.name,
                      // validator: KEmailValidator,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "book name",
                          prefixIcon: Padding(
                            padding: EdgeInsetsDirectional.all(10),
                            child: Icon(Icons.drive_file_rename_outline),
                          )),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      controller: bookPrizeController,
                      keyboardType: TextInputType.name,
                      // validator: KEmailValidator,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "book prize",
                          prefixIcon: Padding(
                            padding: EdgeInsetsDirectional.all(10),
                            child: Icon(Icons.local_convenience_store),
                          )),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      controller: bookTotalQuanitityTextController,
                      keyboardType: TextInputType.number,
                      // validator: KEmailValidator,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Total Books",
                          prefixIcon: Padding(
                            padding: EdgeInsetsDirectional.all(10),
                            child: Icon(Icons.confirmation_num),
                          )),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    DropdownButtonFormField<String>(

                      value: CategoryValue,
                      icon: const Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),
                      decoration: const InputDecoration(
                        labelText :  "Select Category" ,
                        border: OutlineInputBorder(),
                      ),
                      // underline: Container(
                      //   height: 2,
                      //   color: Colors.deepPurpleAccent,
                      // ),
                      onChanged: (String? newValue) {
                        print(newValue);
                        setState(() {

                          CategoryValue = newValue!;
                        });
                      },
                      items: <String>['Novel', 'Fiction', 'Science', 'Arts',"Engineering","Computer","Other"]
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),

                    const SizedBox(
                      height: 25,
                    ),
                    DropdownButtonFormField<String>(

                      value: AvaiabilityValue,
                      icon: const Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),
                      decoration: const InputDecoration(
                        labelText :  "Select Category" ,
                        border: OutlineInputBorder(),
                      ),
                      // underline: Container(
                      //   height: 2,
                      //   color: Colors.deepPurpleAccent,
                      // ),
                      onChanged: (String? newValue) {
                        print(newValue);
                        setState(() {

                          AvaiabilityValue= newValue!;
                        });
                      },
                      items: <String>["True","False"]
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),

                    const SizedBox(
                      height: 25,
                    ),
                    FloatingActionButton(
                      onPressed: getImage,
                      tooltip: 'Increment',
                      child: const Icon(Icons.add),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if(widget.statusOfRequest){
                            imagePath=Main.stock!.getProdudct().image;
                          }
                          checker();
                        },
                        child: const Text("next page"))
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
