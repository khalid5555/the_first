// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:the_first/shared/utils/app_colors.dart';

import 'constants.dart';

// *  MY THEME.........................
class AppThemes {
  static final dk = ThemeData(
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Colors.white38,
      border: InputBorder.none,
      hintStyle: TextStyle(color: Colors.white),
      contentPadding: EdgeInsets.symmetric(
          vertical: defaultPadding * 1.2, horizontal: defaultPadding),
    ),
    scaffoldBackgroundColor: AppColors.kBlColor,
    buttonTheme: const ButtonThemeData(buttonColor: AppColors.kPrColor),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: 'Molhim',
    useMaterial3: true,
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColors.kPrColor))),
    brightness: Brightness.dark,
    primaryColor: AppColors.kBlColor,
    backgroundColor: AppColors.kBlColor,
    textTheme: const TextTheme(
      button: TextStyle(color: AppColors.kPrColor),
    ),
  );

  static final lt = ThemeData(
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Colors.white38,
      border: InputBorder.none,
      hintStyle: TextStyle(color: Colors.white),
      contentPadding: EdgeInsets.symmetric(
          vertical: defaultPadding * 1.2, horizontal: defaultPadding),
    ),
    scaffoldBackgroundColor: AppColors.darkYellow,
    buttonTheme: const ButtonThemeData(buttonColor: AppColors.kPrColor),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColors.kPrColor))),
    fontFamily: 'Molhim',
    useMaterial3: true,
    textTheme: const TextTheme(
      button: TextStyle(color: AppColors.kPrColor),
    ),
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: Colors.teal),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.kPrColor,
    ),
    brightness: Brightness.light,
    primaryColor: AppColors.kPrColor,
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
const kJackets = 'jackets';
const kTrousers = 'trousers';
const kTshirts = 't-shirts';
const kShoes = 'shoes';

const LinearGradient mainButton = LinearGradient(colors: [
  Color.fromRGBO(236, 60, 3, 1),
  Color.fromRGBO(234, 60, 3, 1),
  Color.fromRGBO(216, 78, 16, 1),
], begin: FractionalOffset.topCenter, end: FractionalOffset.bottomCenter);
