import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:govbill/app/api/controller/authentication_controller.dart';
import 'package:govbill/app/pages/login_page/login_page_controller.dart';
import 'package:govbill/app/pages/login_page/widget/login_form_widget.dart';
import 'package:govbill/common/helper/themes.dart';

class LoginPageView extends StatelessWidget {
  final LoginPageController loginPageController = Get.put(LoginPageController());
  final AuthenticationController authenticationController = Get.put(AuthenticationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundPageColor,
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
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
                  iconPrefix: SvgPicture.asset("assets/icons/icLock.svg"),
                  hintText: "Kata Sandi",
                  isObsecure: true,
                  controller: loginPageController.ctrPassword,
                  iconSuffix: IconButton(
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
                    width: double.infinity,
                    height: 55,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 15),
                    decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(10)),
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
