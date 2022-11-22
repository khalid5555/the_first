// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, annotate_overrides, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:the_first/admin/admin.dart';
import 'package:the_first/auth/auth_page.dart';
import 'package:the_first/models/user_model.dart';

import 'home_view.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late Animation<double> opacity;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    opacity = Tween<double>(begin: 1.0, end: 0.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.forward().then((_) {
      navigationPage();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  bool methodName() {
    UserModel userModel = UserModel();
    userModel.id == 'GlmYz214YbNgc0TAId7UwKtajQA3' ||
        userModel.id == 'k62J3ToKQEOHvG8NUflJAWCiF3D2';
    return true;
  }

  void navigationPage() {
    GetStorage box = GetStorage();
    bool isLogin = box.read('login') ?? false;
    Get.offAll(
        () => isLogin == false
            ? AuthPage()
            : methodName()
                ? Admin()
                : HomeView(),
        transition: Transition.zoom);
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.brown),
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              child: Opacity(
                opacity: opacity.value,
                child: Image.asset('assets/images/dd.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Opacity(
                opacity: opacity.value,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(color: Colors.black, fontSize: 23),
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      TextSpan(
                        text: '👌أن تكون انت ألاول',
                        style: TextStyle(
                            color: Colors.pink,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'molhim'),
                      ),
                      TextSpan(
                        text: '😍 هذا ما نسعى إليه',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontFamily: 'molhim'),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
