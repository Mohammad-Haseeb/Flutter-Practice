import 'package:admin_virtual_book_store/Controller/main.dart';
import 'package:admin_virtual_book_store/Screens/prodcut/productdescription.dart';
import 'package:admin_virtual_book_store/Screens/prodcut/productfirstform.dart';
import 'package:admin_virtual_book_store/Screens/productlist.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';




class myDrawer extends StatefulWidget {
   myDrawer({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<myDrawer> createState() => _myDrawerState();
}

class _myDrawerState extends State<myDrawer> {
       bool isSelected=true;

  @override
  Widget build(BuildContext context) {
    return Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            Ink(
              color:  isSelected ? Colors.white : Colors.grey,
              child: ListTile(

                title: const Text('Form 1'),
                onTap: () {
                  setState((){
                  isSelected=false;

                  });
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>   addprodcutfirstform(),),
                  );

                },
              ),
            ),
            Ink(
              color:  isSelected ? Colors.white : Colors.grey,

              child: ListTile(
                title: const Text('Form 2'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  // UserInformation
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>    ProductDescriptionAndSubmit()),
                  );
                },
              ),
            ),
            Ink(
              color:  isSelected ? Colors.white : Colors.grey,

              child: ListTile(
                title: const Text('My Products'),
                onTap: ()async {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  // UserInformation
                  Stream<QuerySnapshot> _usersStreams=await FirebaseFirestore.instance.collection('booksData').where("Product_Owner" , isEqualTo: Main.seller!.getUid().toString()).snapshots();

                  Navigator.pop(context);
                await  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>    UserInformation(usersStreams:_usersStreams)),
                  );
                },
              ),
            ),
          ],
        ),

    );
  }
}