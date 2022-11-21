import 'package:flutter/material.dart';

import '../../models/product_model.dart';
import '../utils/functions.dart';

Widget productsView(String pCategory, List<ProductModel> allProducts) {
  List<ProductModel> products;
  products = getProductByCategory(pCategory, allProducts);
  return GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: .8,
    ),
    itemBuilder: (context, index) {
      var product = products[index];
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: GestureDetector(
          onTap: () {},
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: Image(
                  fit: BoxFit.fill,
                  image: AssetImage(product.pimageurl!),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Opacity(
                  opacity: .6,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            product.pName!,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text('\$ ${products[index].pPrice}')
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    },
    itemCount: products.length,
  );
}
