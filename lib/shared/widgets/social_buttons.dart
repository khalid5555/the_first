import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_first/auth/auth_controller.dart';
import 'package:the_first/shared/utils/app_colors.dart';

import '../utils/app_images.dart';

class SocialButtons extends StatelessWidget {
  SocialButtons({Key? key}) : super(key: key);
  final AuthController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        color: AppColors.kreColor,
        borderRadius: BorderRadius.only(
          topLeft: !controller.showSignUp
              ? const Radius.circular(16)
              : const Radius.circular(0),
          topRight: controller.showSignUp
              ? const Radius.circular(16)
              : const Radius.circular(0),
        ),
      ),
      padding: const EdgeInsets.only(top: 12, bottom: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            AppImages.google,
            width: 35,
            height: 20,
            fit: BoxFit.cover,
          ),
          Center(
            child: Text(
              'Google'.toUpperCase(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
