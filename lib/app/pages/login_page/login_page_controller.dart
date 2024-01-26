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

  // Loading
  var isLoading = false.obs;

  // Login
  Future<void> login() async {
    isLoading.value = true;
    await AuthenticationController.login(
      email: ctrEmail!.text,
      password: ctrPassword!.text,
    ).then((value) {
      if (value == "success") {
        Get.snackbar(
          'Sukses Login',
          "Selamat Datang ${ctrEmail!.text}",
          snackPosition: SnackPosition.TOP,
          backgroundColor: lunasColor,
          colorText: Colors.white,
        );
        isLoading.value = false;
        Get.offAllNamed(Routes.HOME_PAGE);
      } else {
        Get.snackbar(
          'Error',
          value!,
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        isLoading.value = false;
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
