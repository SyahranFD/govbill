import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:govbill/app/api/controller/api_profile_controller.dart';
import 'package:govbill/app/api/controller/authentication_controller.dart';
import 'package:govbill/common/helper/themes.dart';

class ProfilePageView extends StatelessWidget {
  final ApiProfileController apiProfileController = Get.put(ApiProfileController());
  final AuthenticationController authenticationController = Get.put(AuthenticationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundPageColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundPageColor,
        toolbarHeight: 75,
        centerTitle: true,
        title: Text("Profile Kamu", style: tsBodyLargeSemiboldBlack),
      ),
      body: Obx(() {
        if (apiProfileController.isLoading.value) {
          // Tampilkan widget loading jika sedang loading data
          return Center(child: CircularProgressIndicator());
        } else {
          var dataProfile = apiProfileController.listProfile[0];

          return Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Container(
                      //   height: 75,
                      //   width: 75,
                      //   margin: EdgeInsets.only(right: 15, top: 20),
                      //   decoration: BoxDecoration(
                      //       shape: BoxShape.circle,
                      //       image: DecorationImage(
                      //           image: AssetImage("assets/images/ovo.png"),
                      //           fit: BoxFit.fill)),
                      // ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            dataProfile.username!,
                            style: tsBodyLargeSemiboldBlack,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                                color: smoothGreen,
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(dataProfile.email!,
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
                          "Username",
                          style: tsBodySmallSemiboldBlack,
                        ),
                        Text(
                          dataProfile.username!,
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
                          dataProfile.email!,
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
                          dataProfile.phoneNumber!,
                          style: tsLabelRegularDarkGrey,
                        ),
                      ],
                    ),
                  ),

                  GestureDetector(
                    onTap: () async{
                      authenticationController.logout();
                    },
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
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
