import 'dart:ui';

// ignore: import_of_legacy_library_into_null_safe
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// import 'package:the_frist/models/product.dart';

import '../constants.dart';
import '../db/db_store.dart';

class Editproduct extends StatefulWidget {
  static String id = 'editproduct';
  @override
  _EditproductState createState() => _EditproductState();
}

class _EditproductState extends State<Editproduct> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.redAccent,
            title: const Text('التعديل على المنتجات'),
          ),
          body: _drawProducts()),
    );
  }
}

Widget _drawProducts() {
  final mystore = DbStore();
  return StreamBuilder<QuerySnapshot>(
    stream: mystore.loadProduct(),
    builder: (context, snapshot) {
      if (snapshot.hasError) return Text('Error: ${snapshot.error}');
      switch (snapshot.connectionState) {
        case ConnectionState.waiting:
          return const Text('Loading...');
        default:
          return ListView(
            children: snapshot.data!.docs.map((document) {
              return ListTile(
                title: Text(document[kProductName]),
                leading: const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/m11.png'),
                ),
                subtitle: Text(document[kProductPrice]),
                trailing: Text(document[kProductDescription]),
                // trailing: (document[kProductDescription] != null)
                //     ? SizedBox(
                //         width: 150,
                //         height: 150,
                //         child: Image(
                //           image: NetworkImage(document[kProductimages][0]),
                //           fit: BoxFit.cover,
                //         ),
                //       )
                //     : SizedBox(
                //         height: 0,
                //         width: 0,
                //       ),
              );
            }).toList(),
          );
      }
    },
  );
}

// StreamBuilder<QuerySnapshot>(
//           stream: _mystore.loadproduct(),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               List<Product> iproducts = [];
//               for (var doc in snapshot.data.docs) {
//                 var data = doc.data();
//                 iproducts.add(Product(
//                   pName: data[kProductName],
//                   pPrice: data[kProductPrice],
//                   pDescription: data[kProductDescription],
//                   pCategory: data[kProductcategory],
//                   // pimage: data[kProductimages],
//                 ));
//               }

//               return GridView.builder(
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2),
//                 itemBuilder: (context, index) {
//                   return Container(
//                     child: InkWell(
//                       onTap: () {},
//                       child: Column(children: [
//                         ListTile(
//                           leading: Container(
//                             child: Text(
//                               iproducts[index].pName,
//                               style: TextStyle(
//                                 backgroundColor: Colors.amber,
//                                 fontSize: 20,
//                               ),
//                             ),
//                           ),
//                         ),
//                         Container(
//                           child: Text(iproducts[index].pDescription),
//                         ),
//                         Container(
//                           child: Text(
//                             iproducts[index].pPrice,
//                             style: TextStyle(
//                               backgroundColor: Colors.redAccent,
//                               fontSize: 20,
//                             ),
//                           ),
//                         ),
//                         Container(
//                           child: Text(iproducts[index].pCategory),
//                         ),
//                       ]),
//                     ),
//                   );
//                 },
//                 itemCount: iproducts.length,
//               );
//             }
//             return Center(
//               child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text('loading....'),
//                     CircularProgressIndicator(),
//                   ]),
//             );
//           },
//         ),
