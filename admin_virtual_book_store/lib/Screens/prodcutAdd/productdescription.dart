import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:admin_virtual_book_store/Controller/main.dart';
import 'package:admin_virtual_book_store/Controller/stock.dart';
import 'package:admin_virtual_book_store/Controller/product.dart';

class ProductDescriptionAndSubmit extends StatefulWidget {
   ProductDescriptionAndSubmit({Prodcut? product});
       Prodcut? prodcut;
  @override
  _ProductDescriptionAndSubmitState createState() =>
      _ProductDescriptionAndSubmitState();
}

class _ProductDescriptionAndSubmitState
    extends State<ProductDescriptionAndSubmit> {
  final _formKey = GlobalKey<FormState>();
   final _textController=TextEditingController();
  void validate()async{
    // var image = Main.stock?.product?.image;

    print('Description image checker ${Main.stock?.getProdudct().image}');
    print(Main.stock?.getProdudct().prize);
    Main.stock?.SendData();
      // Main.stock?.product?.description=_textController.text;
    dynamic pr=widget.prodcut;
      // pr.image;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Product"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _textController,
                      keyboardType: TextInputType.multiline,
                      maxLines: 3,
                      minLines: 3,
                      decoration: const InputDecoration(
                        prefixIcon: Padding(
                          padding: EdgeInsetsDirectional.only(start: 12.0),
                        ),
                        hintText: "email : xyz@gmail.com",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    ElevatedButton(onPressed:validate, child: const Text("Done"),)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
