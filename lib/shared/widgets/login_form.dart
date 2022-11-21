import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_first/auth/auth_controller.dart';

import 'app_text_field.dart';

class LoginForm extends StatelessWidget {
  LoginForm({Key? key}) : super(key: key);
  AuthController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(right: size.width * 0.080, left: 15),
      child: Form(
        key: !controller.showSignUp ? controller.formkey : null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 2),
            AppTextField(
              myController: controller.email,
              hint: 'ادخل الايميل',
              icon: Icons.phone_android,
            ),
            const SizedBox(height: 15),
            AppTextField(
              myController: controller.password,
              obscureText: true,
              hint: 'أدخل الرقم السري',
              icon: Icons.admin_panel_settings,
              keytyp: TextInputType.number,
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
