import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterPageController extends GetxController {
  TextEditingController? ctrUsername;
  TextEditingController? ctrEmail;
  TextEditingController? ctrPassword;
  TextEditingController? ctrPhoneNumber;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    ctrUsername = TextEditingController();
    ctrEmail = TextEditingController();
    ctrPassword = TextEditingController();
    ctrPhoneNumber = TextEditingController();
  }
}
