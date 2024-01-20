import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:govbill/app/api/controller/api_profile_controller.dart';
import 'package:govbill/common/helper/themes.dart';

class HomeMenyambutUserComponent extends StatelessWidget {
  final ApiProfileController apiProfileController =
  Get.put(ApiProfileController());

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hello,", style: tsTitleMediumSemiboldBlack),
            Obx(() {
              if (!apiProfileController.isLoading.value) {
                return Text(
                  apiProfileController.listProfile.isNotEmpty
                      ? apiProfileController.listProfile[0].username ?? ""
                      : "",
                  style: tsBodySmallRegularBlack,
                );
              } else {
                return Container();
              }
            }),
          ],
        ),

        // Obx(() {
        //   if (!apiProfileController.isLoading.value) {
        //     return ClipOval(
        //         child: Image.network(
        //           "http://127.0.0.1:8000/storage/" + apiProfileController.listProfile[0].profilePicture!,
        //           height: 50,
        //           width: 50,
        //           fit: BoxFit.cover,
        //         )
        //     );
        //   } else {
        //     return Container();
        //   }
        // }),

      ],
    );
  }
}
