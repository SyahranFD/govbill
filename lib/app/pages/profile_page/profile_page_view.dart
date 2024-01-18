import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:govbill/common/helper/themes.dart';

class ProfilePageView extends StatelessWidget {
  const ProfilePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundPageColor,
      appBar: AppBar(
        title: Text(
          "Profile Kamu",
          style: tsBodyLargeSemiboldBlack,
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 75,
                    width: 75,
                    margin: EdgeInsets.only(right: 15, top: 20),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage("assets/images/ovo.png"),
                            fit: BoxFit.fill)),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Radya Harbani",
                        style: tsBodyLargeSemiboldBlack,
                      ),
                      Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: smoothGreen,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text("radya.iam@gmail.com",
                            style: tsLabelMediumWhite),
                      )
                    ],
                  ),
                  Spacer(),
                  SvgPicture.asset("assets/icons/icTableEdit.svg")
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 200,
                width: double.infinity,
                padding: EdgeInsets.all(20),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Nama Lengkap",
                      style: tsBodySmallSemiboldBlack,
                    ),
                    Text(
                      "Radya Harbani",
                      style: tsLabelRegularDarkGrey,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Alamat Email",
                      style: tsBodySmallSemiboldBlack,
                    ),
                    Text(
                      "radya.iam@gmail.com",
                      style: tsLabelRegularDarkGrey,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Nomor Telepon",
                      style: tsBodySmallSemiboldBlack,
                    ),
                    Text(
                      "081334567890",
                      style: tsLabelRegularDarkGrey,
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  height: 55,
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                      color: warningColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Logout",
                          style: tsBodySmallSemiboldWhite,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SvgPicture.asset("assets/icons/icLogout.svg")
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
