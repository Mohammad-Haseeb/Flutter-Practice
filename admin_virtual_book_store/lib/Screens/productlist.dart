import 'package:admin_virtual_book_store/Components/productimage.dart';
import 'package:admin_virtual_book_store/Controller/main.dart';
import 'package:admin_virtual_book_store/Screens/drawer.dart';
import 'package:admin_virtual_book_store/Screens/prodcut/completeproduct.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';


class UserInformation extends StatefulWidget {
  Stream<QuerySnapshot>? usersStreams;
  UserInformation({this.usersStreams});
  @override
  _UserInformationState createState() => _UserInformationState();
}


class _UserInformationState extends State<UserInformation> {
  late Stream<QuerySnapshot> _usersStreams;
  @override
  void initState(){
    super.initState();
     _usersStreams=FirebaseFirestore.instance.collection('booksData').where("Product_Owner" , isEqualTo: Main.seller!.getUid().toString()).snapshots();



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Books"),),
      drawer:  myDrawer(title: '',),
      body: StreamBuilder<QuerySnapshot>(
        stream: widget.usersStreams,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return  const  Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading");
          }

          return  ListView (
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
              print(data);
              print("STate check ${snapshot.connectionState}");
              return Container(
                child: ListTile(
                  subtitle: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(child: ProductImages(data: data,Width: 40,Height: 50,)),
                            Expanded(
                              child: Column(
                                children: [
                                  Text(data["Product_Name"]),
                                  Text("val")
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                      Expanded(

                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children:[
                          TextButton(
                              onPressed:(){print(document.id);
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>    CompleteProduct(data: data,documentId:document.id)),
                              );},
                              child:Text("see more"),)
                        ]),
                      )
                    ],
                  )


                ),

              );
            }).toList(),
          );
        },
      ),
    );
  }
}


//     print("FROM IMage ${widget.data!["ImageURL"].toString()}");
//      try{
//
//        return Container(
//          child:     Image.network(widget.data!["ImageURL"],width: 40,height: 50,fit: BoxFit.scaleDown,)
//
//        );
//
//      }
//      catch(e){
//        print(e);
//        return Text("loading");
//
//      }
//   }

// }
