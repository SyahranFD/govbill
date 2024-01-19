import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:govbill/app/pages/register_page/register_page_controller.dart';
import 'package:govbill/app/pages/register_page/widget/register_form_widget.dart';
import 'package:govbill/common/helper/themes.dart';

class RegisterPageView extends GetView<RegisterPageController> {
  @override
  Widget build(BuildContext context) {
    final _usernameFormKey = GlobalKey<FormState>();
    final _emailFormKey = GlobalKey<FormState>();
    final _phoneNumberFormKey = GlobalKey<FormState>();
    final _passwordFormKey = GlobalKey<FormState>();
    final _passwordConfirmFormKey = GlobalKey<FormState>();

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
                formKey: _usernameFormKey,
                controller: controller.ctrUsername,
              ),
              RegisterFormWidget(
                hintText: "Email",
                iconPrefix: SvgPicture.asset("assets/icons/icEmail.svg"),
                isObsecure: false,
                formKey: _emailFormKey,
                validator: (value) {
                  if (controller.validateEmail(value!) == false) {
                    return "Masukkan Email Yang Valid";
                  }
                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.emailAddress,
                controller: controller.ctrEmail,
              ),
              RegisterFormWidget(
                hintText: "No. Telepon", 
                iconPrefix: SvgPicture.asset("assets/icons/icPhone.svg"),
                isObsecure: false,
                keyboardType: TextInputType.number,
                inputFormatters: [LengthLimitingTextInputFormatter(12)],
                formKey: _phoneNumberFormKey,
                validator: (value) {
                  if (controller.validatePhoneNumber(value) == false) {
                    return "Nomor telepon berawalan 08";
                  }
                  return null;
                },
                controller: controller.ctrPhoneNumber,
              ),
              Obx(() => RegisterFormWidget(
                    hintText: "Password",
                    iconPrefix: SvgPicture.asset("assets/icons/icLock.svg"),
                    isObsecure: controller.isPasswordInvisible.value,
                    formKey: _passwordFormKey,
                    validator: (value) {
                      if (controller.isPasswordValid(value!) == false) {
                        return "Password harus mengandung huruf besar dan angka";
                      }
                      ;
                      return null;
                    },
                    iconSuffix: IconButton(
                      onPressed: () {
                        controller.isPasswordInvisible.value =
                            !controller.isPasswordInvisible.value;
                      },
                      icon: Icon(
                        controller.isPasswordInvisible.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: darkGrey,
                      ),
                    ),
                    controller: controller.ctrPassword,
                  )),
              Obx(() => RegisterFormWidget(
                    hintText: "Konfirmasi Password",
                    iconPrefix: SvgPicture.asset("assets/icons/icLock.svg"),
                    isObsecure: controller.isPasswordConfirmInvisible.value,
                    formKey: _passwordConfirmFormKey,
                    validator: (value) {
                      if (controller.confirmPassword(
                              controller.ctrPassword!.text, value!) ==
                          false) {
                        return "Password tidak sama";
                      }
                      return null;
                    },
                    iconSuffix: IconButton(
                      onPressed: () {
                        controller.isPasswordConfirmInvisible.value =
                            !controller.isPasswordConfirmInvisible.value;
                      },
                      icon: Icon(
                        controller.isPasswordConfirmInvisible.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: darkGrey,
                      ),
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () async {
                  if (_usernameFormKey.currentState!.validate() &&
                      _emailFormKey.currentState!.validate() &&
                      _phoneNumberFormKey.currentState!.validate() &&
                      _passwordFormKey.currentState!.validate() &&
                      _passwordConfirmFormKey.currentState!.validate()) {
                    controller.register();
                  } else {
                    print("kocak");
                  }
                },
                child: Obx(() {
                  return controller.isLoading.value
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
