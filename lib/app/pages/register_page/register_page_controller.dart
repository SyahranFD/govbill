
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:govbill/app/api/controller/authentication_controller.dart';
import 'package:govbill/common/routes/app_pages.dart';

class RegisterPageController extends GetxController {
  final AuthenticationController authenticationController =
      Get.put(AuthenticationController());

  TextEditingController? ctrUsername = TextEditingController();
  TextEditingController? ctrEmail = TextEditingController();
  TextEditingController? ctrPassword = TextEditingController();
  TextEditingController? ctrPhoneNumber = TextEditingController();

  var isPasswordInvisible = true.obs;
  var isPasswordConfirmInvisible = true.obs;
  var isLoading = false.obs;

  void register() async {
    await authenticationController.register(
        username: ctrUsername!.text,
        email: ctrEmail!.text,
        password: ctrPassword!.text,
        phoneNumber: ctrPhoneNumber!.text);
    isLoading.value = authenticationController.isLoading.value;
    Get.offAll(Routes.TAMBAH_METODE_PEMBAYARAN_PAGE);
  }

  bool? validateEmail(String value) {
    // Regular expression untuk memeriksa alamat email
    final emailRegex = RegExp(
      r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
    );

    if (!emailRegex.hasMatch(value)) {
      return false;
    }

    return true;
  }

  bool isPasswordValid(String password) {
    // Define a regular expression pattern
    RegExp regex = RegExp(r'^(?=.*[A-Z])(?=.*\d).+$');

    // Use the test method to check if the password matches the pattern
    return regex.hasMatch(password);
  }

  bool confirmPassword(String password, String confirmPassword) {
    if (password != confirmPassword) {
      return false;
    }
    return true;
  }

  bool? validatePhoneNumber(String? value) {
    // Remove any non-numeric characters
    String cleanedValue = value?.replaceAll(RegExp(r'\D'), '') ?? '';

    // Check if the cleaned value starts with "08"
    if (cleanedValue.startsWith('08')) {
      return true; // Valid
    } else {
      return false;
    }
  }
  
}
