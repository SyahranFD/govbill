import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:govbill/app/pages/register_page/widget/register_form_widget.dart';
import 'package:govbill/common/helper/themes.dart';

class RegisterPageView extends StatelessWidget {
  const RegisterPageView({Key? key}) : super(key: key);

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
                height: 40,
              ),
              RegisterFormWidget(
                hintText: "Email",
                iconPrefix: SvgPicture.asset("assets/icons/icEmail.svg"),
                isObsecure: false,
              ),
              RegisterFormWidget(
                hintText: "No. Telepon",
                iconPrefix: SvgPicture.asset("assets/icons/icPhone.svg"),
                isObsecure: false,
              ),
              RegisterFormWidget(
                hintText: "Password",
                iconPrefix: SvgPicture.asset("assets/icons/icLock.svg"),
                isObsecure: false,
              ),
              RegisterFormWidget(
                hintText: "Password",
                iconPrefix: SvgPicture.asset("assets/icons/icLock.svg"),
                isObsecure: false,
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                child: Container(
                  child: Text("Daftar Sekarang "),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
