import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPageController extends GetxController {
  TextEditingController? ctrEmail;
  TextEditingController? ctrPassword;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    ctrEmail = TextEditingController();
    ctrPassword = TextEditingController();
  }
}
