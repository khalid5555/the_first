// import 'package:firebase_auth/firebase_auth.dart';
// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_first/screen/login_view.dart';

import '../widget screen/customtextfield.dart';

class SingUp extends StatefulWidget {
  const SingUp({super.key});

  @override
  _SingUpState createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {
  final _formkey = GlobalKey<FormState>();

  String? email, password, name;

  // final _myAuth = Auth();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * .015;
    return Scaffold(
      body: Form(
        key: _formkey,
        child: ListView(
          children: [
            SizedBox(height: height),
            SizedBox(
              height: MediaQuery.of(context).size.height * .31,
              child: Image(
                image: AssetImage('assets/images/final.png'),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: height * 10),
            CustomTextField(
              hint: 'أدخل  الاسم',
              icon: Icons.perm_identity,
              keytyp: TextInputType.name,
              onClick: (value) {
                name = value;
              },
            ),
            SizedBox(height: height),
            CustomTextField(
              keytyp: TextInputType.emailAddress,
              hint: 'أدخل ألاميل',
              icon: Icons.email,
              onClick: (value) {
                email = value;
              },
            ),
            SizedBox(height: height),
            CustomTextField(
              keytyp: TextInputType.number,
              hint: 'أدخل الرقم السري',
              icon: Icons.admin_panel_settings,
              onClick: (value) {
                password = value;
              },
            ),
            SizedBox(height: height * 3),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: MaterialButton(
                padding: EdgeInsets.only(top: 16, bottom: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () async {
                  // showLoading(context, true);
                  // if (_formkey.currentState!.validate()) {
                  //   _formkey.currentState!.save();

                  //   try {
                  //     var res = await _myAuth.signUp(
                  //         email!.trim(), password!.trim());
                  //     await _myAuth.createUser(UserModel(
                  //         id: res.user!.uid, name: name!, email: email!));

                  //     Get.to(() => LoginScreen());
                  //   } catch (e) {
                  //     print(e);
                  //   }

                  // showLoading(context, false);
                  // }
                },
                child: Text(
                  ' تسجيل حساب ',
                ),
              ),
            ),
            SizedBox(height: height),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    Get.off(
                      () => LoginScreen(),
                      transition: Transition.zoom,
                      duration: const Duration(seconds: 1),
                    );
                  },
                  child: Text(
                    '  تسجيل الدخول  ',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Text(
                  '  لديك حساب بالفعل أذهب  ?',
                  style: TextStyle(fontSize: 16, color: Colors.black38),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
