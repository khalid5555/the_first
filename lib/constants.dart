// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

//todo   my colors the project...
const Color kPrColor = Color.fromARGB(255, 20, 184, 220);
// const Color kPrColor = Color(0xff1B95AF);
const Color darkYellow = Color(0xffE99E22);
const Color transparentYellow = Color.fromARGB(177, 255, 184, 69);
const Color kDarkGrey = Color(0xff202020);

const Color kScColor = Color.fromARGB(255, 58, 186, 246);
const Color kGrColor = Color.fromARGB(255, 127, 116, 116);
const Color kylColor = Color(0xffFDC054);
const Color kBlColor = Colors.black;
const Color kbiColor = Color.fromARGB(255, 213, 59, 230);
const Color kreColor = Color.fromARGB(255, 255, 79, 176);
const Color pr2Color = Color.fromARGB(-25, 199, 253, 191);

//! IMAGES.............
const String KPICSPLASH = 'assets/images/note2.json';
const String KPICN1 = 'assets/images/n1.png';
const String KPICN2 = 'assets/images/n2.png';
const String KPICN3 = 'assets/images/n3.png';
const String Kh1 = 'assets/images/kh1.jpg';

// *  MY THEME.........................
class My_Themes {
  static final dk = ThemeData(
    scaffoldBackgroundColor: kPrColor,
    buttonTheme: const ButtonThemeData(buttonColor: kPrColor),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: 'Molhim',
    useMaterial3: true,
    outlinedButtonTheme: OutlinedButtonThemeData(
        style:
            ButtonStyle(backgroundColor: MaterialStateProperty.all(kPrColor))),
    brightness: Brightness.dark,
    primaryColor: kBlColor,
    backgroundColor: kBlColor,
    textTheme: const TextTheme(
      button: TextStyle(color: kPrColor),
    ),
  );

  static final lt = ThemeData(
    scaffoldBackgroundColor: kBlColor,
    buttonTheme: const ButtonThemeData(buttonColor: kPrColor),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style:
            ButtonStyle(backgroundColor: MaterialStateProperty.all(kPrColor))),
    fontFamily: 'Molhim',
    useMaterial3: true,
    textTheme: const TextTheme(
      button: TextStyle(color: kPrColor),
    ),
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: Colors.teal),
    appBarTheme: const AppBarTheme(
      backgroundColor: kPrColor,
    ),
    brightness: Brightness.light,
    primaryColor: kPrColor,
  );
}

TextStyle get inPutStyle {
  return const TextStyle(
    fontFamily: 'Molhim',
    fontSize: 15,
    fontWeight: FontWeight.bold,
  );
}

TextStyle get subheading {
  return const TextStyle(
    fontFamily: 'Molhim',
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
}

TextStyle get headingStyle {
  return const TextStyle(
    fontSize: 25,
    fontFamily: 'Molhim',
    fontWeight: FontWeight.bold,
  );
}

//!   Variable const
const kProductsCollection = 'Products';
const kUserCollection = 'users';
const kProductimages = 'Productimages';
const kProductcategory = 'Productcategory';
const kProductPrice = 'Productprice';
const kProductName = 'Productname';
const kProductDescription = 'Productdescription';
const kProductid = 'Productid';
const kUnActiveColor = Color(0xFFC1BDB8);
const kJackets = 'jackets';
const kTrousers = 'trousers';
const kTshirts = 't-shirts';
const kShoes = 'shoes';

const LinearGradient mainButton = LinearGradient(colors: [
  Color.fromRGBO(236, 60, 3, 1),
  Color.fromRGBO(234, 60, 3, 1),
  Color.fromRGBO(216, 78, 16, 1),
], begin: FractionalOffset.topCenter, end: FractionalOffset.bottomCenter);
