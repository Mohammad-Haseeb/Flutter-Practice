import 'package:flutter/material.dart';
import 'package:dropdown_plus/dropdown_plus.dart';



class addprodcutfirstform extends StatefulWidget {
  const addprodcutfirstform({Key? key}) : super(key: key);

  @override
  _addprodcutfirstformState createState() => _addprodcutfirstformState();
}

class _addprodcutfirstformState extends State<addprodcutfirstform> {
  final _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("Add Product"),),
      body: SafeArea(
        child:Column(
            children: [
          Form(
          autovalidateMode: AutovalidateMode.always,
          key: _formKey,
            child: Column(
              children: [
                TextFormField(
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
                TextFormField(
                  keyboardType: TextInputType.name,
                  // validator: KEmailValidator,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "book prize",
                      prefixIcon: Padding(
                        padding: EdgeInsetsDirectional.all(10),
                        child: Icon(Icons.local_convenience_store
                        ),
                      )),
                ),
                TextFormField(
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
                TextDropdownFormField(
                  options:const ["Male", "Female"],
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.arrow_drop_down),
                      labelText: "Gender"),
                  dropdownHeight: 120,
                ),
                TextDropdownFormField(
                  options:const ["Male", "Female"],
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.arrow_drop_down),
                      labelText: "Online Availability"),
                  dropdownHeight: 120,
                ),


              ],
            ),
          )
            ],
        )
      ),
    );
  }
}


