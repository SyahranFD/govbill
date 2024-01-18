import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:govbill/app/api/controller/authentication.dart';
import 'package:govbill/app/pages/register_page/register_page_controller.dart';
import 'package:govbill/app/pages/register_page/widget/register_form_widget.dart';
import 'package:govbill/common/helper/themes.dart';

class RegisterPageView extends StatelessWidget {
  final RegisterPageController registerPageController =
      Get.put(RegisterPageController());
  final AuthenticationController authenticationController =
      Get.put(AuthenticationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundPageColor,
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                alignment: Alignment.topRight,
                margin: EdgeInsets.only(right: 20),
                child: Image.asset(
                  "assets/images/logo.png",
                ),
              ),
              SizedBox(
                height: 22,
              ),
              Text(
                "Daftar Akun",
                style: tsHeadlineSmallBoldDarkBlue,
              ),
              Text(
                "Daftarkan akun anda dengan mengisi kolom dibawah ini",
                style: tsBodyMediumRegularDarkGrey,
              ),
              SizedBox(
                height: 30,
              ),
              RegisterFormWidget(
                hintText: "Username",
                iconPrefix: SvgPicture.asset("assets/icons/icUser.svg"),
                isObsecure: false,
                controller: registerPageController.ctrUsername,
              ),
              RegisterFormWidget(
                hintText: "Email",
                iconPrefix: SvgPicture.asset("assets/icons/icEmail.svg"),
                isObsecure: false,
                controller: registerPageController.ctrEmail,
              ),
              RegisterFormWidget(
                hintText: "No. Telepon",
                iconPrefix: SvgPicture.asset("assets/icons/icPhone.svg"),
                isObsecure: false,
                controller: registerPageController.ctrPhoneNumber,
              ),
              RegisterFormWidget(
                hintText: "Password",
                iconPrefix: SvgPicture.asset("assets/icons/icLock.svg"),
                isObsecure: false,
                iconSuffix: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.visibility,
                    color: darkGrey,
                  ),
                ),
                controller: registerPageController.ctrPassword,
              ),
              RegisterFormWidget(
                hintText: "Password",
                iconPrefix: SvgPicture.asset("assets/icons/icLock.svg"),
                isObsecure: false,
                iconSuffix: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.visibility,
                    color: darkGrey,
                  ),
                ),
                controller: registerPageController.ctrPassword,
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () async {
                  await authenticationController.register(
                    username: registerPageController.ctrUsername!.text,
                    email: registerPageController.ctrEmail!.text,
                    password: registerPageController.ctrPassword!.text,
                    phoneNumber: registerPageController.ctrPhoneNumber!.text,
                  );
                },
                child: Obx(() {
                  return authenticationController.isLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: secondaryColor,
                          ),
                        )
                      : Container(
                          width: double.infinity,
                          height: 55,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            "Daftar Sekarang ",
                            style: tsBodyMediumSemiboldWhite,
                          ),
                      );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
