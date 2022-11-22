import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:the_first/auth/auth_bindings.dart';

import '../admin/admin.dart';
import '../db/auth.dart';
import '../models/user_model.dart';
import '../view/home_view.dart';
import 'auth_page.dart';

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
        if (res.user!.uid == 'GlmYz214YbNgc0TAId7UwKtajQA3' ||
            res.user!.uid == 'k62J3ToKQEOHvG8NUflJAWCiF3D2') {
          //     msg: 'اهلا بيك كلنا حوليك '

          Get.off(
            () => const Admin(),
            binding: AuthBindings(),
            transition: Transition.size,
            duration: const Duration(seconds: 1),
          );
        } else {
          Get.off(
            () => const HomeView(),
            transition: Transition.size,
            binding: AuthBindings(),
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
      () => const HomeView(),
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

  void signOut() async {
    await _myAuth.signOut();
    upDateLogin();
    Get.to(() => const AuthPage(), binding: AuthBindings());
  }
}
