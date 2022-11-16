// ignore_for_file: library_private_types_in_public_api

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:the_first/models/product_model.dart';
import '../constants.dart';

import '../db/db_store.dart';

import '../new%20dash/product_page.dart';

class AllProducts extends StatefulWidget {
  const AllProducts({super.key});
  @override
  _AllProductsState createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  final _myStore = DbStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('كل المنتجات'),
      ),
      body: drawProducts(),
    );
  }

  Widget drawProducts() {
    return StreamBuilder<QuerySnapshot>(
      stream: _myStore.loadProduct(),
      builder: (context, snapshot) {
        // final double height = MediaQuery.of(context).size.height;
        // final double width = MediaQuery.of(context).size.width;
        if (snapshot.hasError) return Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Text('Loading...');
          default:
            return ListView(
              children: snapshot.data!.docs.map((document) {
                return ListTile(
                  title: Text(document[kProductName]),
                  subtitle: Text(document[kProductPrice]),
                  // trailing: Text(document[kProductDescription]),
                  trailing: (document[kProductDescription] != null)
                      ? SizedBox(
                          width: 150,
                          height: 150,
                          child: Image(
                            image: NetworkImage(document[kProductimages]),
                            fit: BoxFit.cover,
                          ),
                        )
                      : const SizedBox(
                          height: 0,
                          width: 0,
                        ),
                );
              }).toList(),
            );
        }
      },
    );
  }
}

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final double height;
  final double width;

  const ProductCard(
      {Key? key,
      required this.product,
      required this.height,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => ProductPage(product: product))),
      child: Stack(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(left: 30),
            height: height,
            width: width,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(24)),
              color: Colors.yellowAccent,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.favorite_border),
                  onPressed: () {},
                  color: Colors.white,
                ),
                Column(
                  children: <Widget>[
                    Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            product.pName ?? '',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16.0),
                          ),
                        )),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 12.0),
                        padding: const EdgeInsets.fromLTRB(8.0, 4.0, 12.0, 4.0),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10)),
                          color: Color.fromRGBO(224, 69, 10, 1),
                        ),
                        child: Text(
                          '\$${product.pPrice ?? 0.0}',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            child: Hero(
              tag: product.pimageurl.toString(),
              child: Image.asset(
                product.pimageurl.toString(),
                height: height / 1.5,
                width: width / 1.4,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
