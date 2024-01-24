import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:govbill/app/api/controller/authentication_controller.dart';
import 'package:govbill/common/helper/themes.dart';
import 'package:govbill/common/routes/app_pages.dart';

class LoginPageController extends GetxController {
  TextEditingController? ctrEmail = TextEditingController();
  TextEditingController? ctrPassword = TextEditingController();

  // Icon Visibility
  var isObsecure = true.obs;

  // Login
  Future<void> login() async {
    await AuthenticationController.login(
      email: ctrEmail!.text,
      password: ctrPassword!.text,
    ).then((value) {
      if (value == "success") {
        Get.offAllNamed(Routes.HOME_PAGE);
        Get.snackbar(
          'Sukses Login',
          "Selamat Datang $ctrEmail.text",
          snackPosition: SnackPosition.TOP,
          backgroundColor: successColor,
          colorText: Colors.white,
        );
        Get.offAllNamed(Routes.HOME_PAGE);
      } else {
        Get.snackbar(
          'Error',
          value!,
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    });
  }

  bool? validateEmail(String? value) {
    // Regular expression untuk memeriksa alamat email
    final emailRegex = RegExp(
      r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
    );

    if (!emailRegex.hasMatch(value!)) {
      return false;
    }

    return true;
  }
}
