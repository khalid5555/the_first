// import 'package:buy_it/constants.dart';
// import 'package:buy_it/models/product.dart';
// import 'package:buy_it/provider/cartItem.dart';
// import 'package:buy_it/screens/user/CartScreen.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/product_model.dart';
// import 'package:provider/provider.dart';

class ProductInfo extends StatefulWidget {
  static String id = 'ProductInfo';
  @override
  _ProductInfoState createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  int _quantity = 1;
  ProductModel product = ProductModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image(
              fit: BoxFit.fill,
              image: NetworkImage(product.pimageurl!),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back_ios)),
                  GestureDetector(
                      onTap: () {
                        // Navigator.pushNamed(context, CartScreen.id);
                      },
                      child: const Icon(Icons.shopping_cart))
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Column(
              children: <Widget>[
                Opacity(
                  opacity: .5,
                  child: Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * .3,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            product.pName!,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            product.pDescription!,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w800),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            '\$${product.pPrice}',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ClipOval(
                                child: Material(
                                  color: kPrColor,
                                  child: GestureDetector(
                                    onTap: add,
                                    child: const SizedBox(
                                      height: 32,
                                      width: 32,
                                      child: Icon(Icons.add),
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                _quantity.toString(),
                                style: const TextStyle(fontSize: 60),
                              ),
                              ClipOval(
                                child: Material(
                                  color: kPrColor,
                                  child: GestureDetector(
                                    onTap: subtract,
                                    child: const SizedBox(
                                      height: 32,
                                      width: 32,
                                      child: Icon(Icons.remove),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                ButtonTheme(
                  minWidth: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .08,
                  child: Builder(
                    builder: (context) => MaterialButton(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              topLeft: Radius.circular(10))),
                      color: kPrColor,
                      onPressed: () {
                        // addToCart(context, product);
                      },
                      child: Text(
                        'Add to Cart'.toUpperCase(),
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  subtract() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
        print(_quantity);
      });
    }
  }

  add() {
    setState(() {
      _quantity++;
      print(_quantity);
    });
  }

  /* void addToCart(context, product) {
    CartItem cartItem = Provider.of<CartItem>(context, listen: false);
    product.pQuantity = _quantity;
    bool exist = false;
    var productsInCart = cartItem.products;
    for (var productInCart in productsInCart) {
      if (productInCart.pName == product.pName) {
        exist = true;
      }
    }
    if (exist) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('you\'ve added this item before'),
      ));
    } else {
      cartItem.addProduct(product);
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Added to Cart'),
      ));
    }
  } */
}
