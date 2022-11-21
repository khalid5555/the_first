import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../admin/admin.dart';
import '../db/auth.dart';
import '../models/user_model.dart';
import '../view/home_view.dart';

class AuthController extends GetxController {
  var formkey = GlobalKey<FormState>();
  bool showSignUp = false;
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final _myAuth = Auth();

  void signIn() async {
    if (formkey.currentState!.validate()) {
      try {
        formkey.currentState!.save();

        final res = await _myAuth.signIn(email.text, password.text);
        upDateLogin();
        if (res.user!.uid == '9cCwmEojIderBAt420VaWpzHufS2' ||
            res.user!.uid == '285001kIAJg7nSzz8eyBFkdMxZL2') {
          //     msg: 'اهلا بيك كلنا حوليك '

          Get.off(
            () => const Admin(),
            transition: Transition.size,
            duration: const Duration(seconds: 1),
          );
        } else {
          Get.off(
            () => HomeView(),
            transition: Transition.size,
            duration: const Duration(seconds: 1),
          );
          // Navigator.of(context)
          //     .pushReplacementNamed('productshow.id');
          // Fluttertoast.showToast(msg: 'اهلا بيك ');
        }
      } catch (e) {
        // Fluttertoast.showToast(
        //     msg: e.toString(),
        //     toastLength: Toast.LENGTH_LONG);
      }
    }
  }

  void signUpGoogle() async {
    final res = await _myAuth.signInWithGoogle();
    await _myAuth.createUser(
      UserModel(
        id: res.user!.uid,
        name: res.user!.displayName ?? '',
        email: res.user!.email ?? '',
      ),
    );
    upDateLogin();
    Get.offAll(
      () => HomeView(),
      transition: Transition.size,
      duration: const Duration(seconds: 1),
    );
    // Fluttertoast.showToast(msg: 'اهلا بيك ');
  }

  void upDateLogin() async {
    GetStorage box = GetStorage();
    box.write('login', true);
    box.write('seen', true);
  }
}
