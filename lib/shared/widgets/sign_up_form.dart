import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_first/auth/auth_controller.dart';

import 'app_text_field.dart';

class SignUpForm extends StatelessWidget {
  SignUpForm({Key? key}) : super(key: key);
  AuthController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(left: size.width * 0.099, right: 15),
      child: Form(
        key: controller.showSignUp ? controller.formkey : null,
        child: Column(
          children: [
            const Spacer(flex: 2),
            AppTextField(
              myController: controller.name,
              hint: 'أدخل  الاسم',
              icon: Icons.perm_identity,
              keytyp: TextInputType.name,
            ),
            const SizedBox(height: 15),
            AppTextField(
              myController: controller.email,
              keytyp: TextInputType.emailAddress,
              hint: 'أدخل ألاميل',
              icon: Icons.email,
            ),
            const SizedBox(height: 15),
            AppTextField(
              myController: controller.password,
              keytyp: TextInputType.number,
              hint: 'أدخل الرقم السري',
              icon: Icons.admin_panel_settings,
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
