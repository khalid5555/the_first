import 'package:flutter/material.dart';

import '../constants.dart';
import '../new%20dash/product_list.dart';

class Detials extends StatefulWidget {
  static String id = 'detialsproduct';
  @override
  _DetialsState createState() => _DetialsState();
}

class _DetialsState extends State<Detials> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 0.12),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.only(left: 0, top: 15),
          child: Align(
            alignment: Alignment.topLeft,
            child: (Text(
              kProductName,
              style: const TextStyle(
                  color: Color(0xfff19528),
                  fontWeight: FontWeight.w400,
                  fontFamily: "Oswald",
                  fontSize: 18.0),
            )),
          ),
        ),
        actions: <Widget>[Container(child: Image.asset('assets/actions.png'))],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'assets/background.png',
              fit: BoxFit.cover,
            ),
          ),

          // Main Body

          SingleChildScrollView(
              child:
                  // ProductCard(),
                  Container()),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
