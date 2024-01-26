import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:govbill/app/pages/login_page/login_page_controller.dart';
import 'package:govbill/app/pages/login_page/widget/login_form_widget.dart';
import 'package:govbill/common/helper/themes.dart';
import 'package:govbill/common/routes/app_pages.dart';

class LoginPageView extends GetView<LoginPageController> {
  LoginPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final _emailFormKey = GlobalKey<FormState>();
    final _passwordFormKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: backgroundPageColor,
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
<<<<<<< HEAD
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                  alignment: Alignment.topRight,
                  margin: EdgeInsets.only(right: 15, bottom: 20),
                  child: Image.asset("assets/images/logo.png")),
              Text(
                "Login Akun",
                style: tsHeadlineSmallBoldDarkBlue,
              ),
              Text(
                "Masukkan Identitas Anda DIbawah Ini",
                style: tsBodyMediumRegularDarkGrey,
              ),
              SizedBox(
                height: 40,
              ),
              LoginFormWidget(
                iconPrefix: SvgPicture.asset("assets/icons/icEmail.svg"),
                hintText: "Email",
                isObsecure: false,
                formKey: _emailFormKey,
                validator: (value) {
                  if (controller.validateEmail(value) == false) {
                    return "Email Tidak Valid";
                  }
                  return null;
                },
                controller: controller.ctrEmail,
              ),
              Obx(() => LoginFormWidget(
=======
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [ 
                SizedBox(
                  height: 50,
                ),
                Container(
                    alignment: Alignment.topRight,
                    margin: EdgeInsets.only(right: 15, bottom: 20),
                    child: Image.asset("assets/images/logo.png")),
                Text(
                  "Login Akun",
                  style: tsHeadlineSmallBoldDarkBlue,
                ),
                Text(
                  "Masukkan Identitas Anda DIbawah Ini",
                  style: tsBodyMediumRegularDarkGrey,
                ),
                if (authenticationController.errorLogin.value == 3)
                  Container(
                    height: 40,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Anda telah gagal login 3 kali. Harap tunggu 5 detik sebelum mencoba lagi.",
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                SizedBox(
                  height: 40,
                ),
                LoginFormWidget(
                  iconPrefix: SvgPicture.asset("assets/icons/icEmail.svg"),
                  hintText: "Email",
                  isObsecure: false,
                  controller: loginPageController.ctrEmail,
                  readOnly: authenticationController.errorLogin.value == 3,
                ),
                LoginFormWidget(
>>>>>>> c4a4a9fdc3e3a2bdadf0efe2234c33da2084d7b5
                  iconPrefix: SvgPicture.asset("assets/icons/icLock.svg"),
                  hintText: "Kata Sandi",
                  isObsecure: controller.isObsecure.value,
                  controller: controller.ctrPassword,
                  formKey: _passwordFormKey,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password Harus Diisi";
                    }
                    return null;
                  },
                  iconSuffix: IconButton(
<<<<<<< HEAD
                      onPressed: () {
                        controller.isObsecure.value =
                            !controller.isObsecure.value;
                      },
                      icon: controller.isObsecure.value
                          ? Icon(
                              Icons.visibility_off,
                              size: 25,
                            )
                          : Icon(
                              Icons.visibility,
                              size: 25,
                            )))),
              GestureDetector(
                onTap: () async {
                  _emailFormKey.currentState!.validate();
                  if (_emailFormKey.currentState!.validate() &&
                      _passwordFormKey.currentState!.validate()) {
                    await controller.login();
                  }
                },
                child: Container(
=======
                    onPressed: () {}, 
                    icon: Icon(Icons.visibility),
                  ),
                  readOnly: authenticationController.errorLogin.value == 3,
                ),
                GestureDetector(
                  onTap: () async {
                    await authenticationController.login(
                      email: loginPageController.ctrEmail!.text,
                      password: loginPageController.ctrPassword!.text,
                    );
                  },
                  child: Container(
>>>>>>> c4a4a9fdc3e3a2bdadf0efe2234c33da2084d7b5
                    width: double.infinity,
                    height: 55,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 15),
                    decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(10)),
<<<<<<< HEAD
                    child: Obx(() => controller.isLoading.value == true
                        ? Transform.scale(
                            scale: 0.5,
                            child: CircularProgressIndicator(
                              strokeWidth: 4,
                              color: primaryColor,
                            ),
                          )
                        : Text(
                            "Login",
                            style: tsBodyMediumSemiboldWhite,
                          ))),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Belum punya akun?",
                    style: tsLabelRegularDarkGrey,
                  ),
                  TextButton(
                      onPressed: () {
                        Get.toNamed(Routes.REGISTER_PAGE);
                      },
=======
                    child: Text(
                      "Login",
                      style: tsBodyMediumSemiboldWhite,
                    ),
                  ),
                ),                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Belum punya akun?",
                      style: tsLabelRegularDarkGrey,
                    ),
                    TextButton(
                      onPressed: () {},
>>>>>>> c4a4a9fdc3e3a2bdadf0efe2234c33da2084d7b5
                      child: Text(
                        "Daftar Sekarang!",
                        style: tsLabelRegularDarkBlue,
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
}
