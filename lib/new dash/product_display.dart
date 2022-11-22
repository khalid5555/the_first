// import 'package:ecommerce_int2/app_properties.dart';
// import 'package:ecommerce_int2/models/product.dart';
// import 'package:ecommerce_int2/screens/rating/rating_page.dart';
import 'package:flutter/material.dart';
import 'package:the_first/models/product_model.dart';

/* كلاس السعر والصورة في صفحة تفاصيل المنتج  */

class ProductDisplay extends StatelessWidget {
  final ProductModel? product;

  const ProductDisplay({Key? key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
            top: 30.0,
            right: 0,
            child: Container(
                width: MediaQuery.of(context).size.width / 1.5,
                height: 85,
                padding: const EdgeInsets.only(right: 24),
                decoration: BoxDecoration(
                    color: Colors.blueGrey.shade300,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomLeft: Radius.circular(12)),
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.16),
                          offset: Offset(0, 3),
                          blurRadius: 6.0),
                    ]),
                child: Align(
                  alignment: const Alignment(1, 0),
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: '\$ ${product!.pPrice}',
                        style: const TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontWeight: FontWeight.w400,
                            // fontFamily: "Montserrat",
                            fontSize: 40.0)),
                    const TextSpan(
                        text: '.58',
                        style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontWeight: FontWeight.w400,
                            // fontFamily: "Montserrat",
                            fontSize: 18.0))
                  ])),
                ))),
        Align(
          alignment: const Alignment(-1, 0),
          child: Padding(
            padding: const EdgeInsets.only(right: 20.0, left: 20.0),
            child: SizedBox(
              height: screenAwareSize(220, context),
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 18.0,
                    ),
                    child: Container(
                      child: Hero(
                        tag: product!.pImageUrl.toString(),
                        child: Image.asset(
                          product!.pImageUrl.toString(),
                          fit: BoxFit.fill,
                          height: 230,
                          width: MediaQuery.of(context).size.width / 2.5,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),

        // ايقونة القلب اللي بتودي علي صفحة التقييم
        Positioned(
          left: 20.0,
          bottom: 0.0,
          child: RawMaterialButton(
            onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const ProductDisplay())),
            constraints: const BoxConstraints(minWidth: 45, minHeight: 45),
            elevation: 0.0,
            shape: const CircleBorder(),
            fillColor: const Color.fromRGBO(255, 255, 255, 0.4),
            child: const Icon(Icons.favorite,
                color: Color.fromRGBO(255, 137, 147, 1)),
          ),
        )
      ],
    );
  }
}

screenAwareSize(int size, BuildContext context) {
  double baseHeight = 640.0;
  return size * MediaQuery.of(context).size.height / baseHeight;
}
