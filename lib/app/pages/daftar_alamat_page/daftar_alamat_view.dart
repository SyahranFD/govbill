import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:govbill/app/api/model/alamat_model.dart';
import 'package:govbill/app/pages/daftar_alamat_page/daftar_alamat_controller.dart';
import 'package:govbill/app/pages/daftar_alamat_page/widget/alamat_shimmer.dart';
import 'package:govbill/common/helper/themes.dart';

class DaftarAlamatPageView extends GetView<DaftarAlamatPageController> {
  const DaftarAlamatPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      backgroundColor: backgroundPageColor,
      appBar: AppBar(
        title: Text(
          "Daftar Alamat",
          style: tsBodyLargeSemiboldBlack,
        ),
        centerTitle: true,
        backgroundColor: backgroundPageColor,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Padding(
              padding: EdgeInsets.all(10),
              child: SvgPicture.asset("assets/icons/icArrowBack.svg")),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              FutureBuilder<List<AlamatData>>(
                future: controller.fetchAlamat(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<AlamatData> alamats = snapshot.data!;
                    return ListView.builder(
                      itemCount: alamats.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        AlamatData alamat = alamats[index];
                        return GestureDetector(
                          onTap: () {
                            Get.back(result: "${alamat.id}");
                          },
                          child: Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(bottom: 15),
                            height: index == 0 ? 200 : 180,
                            padding: EdgeInsets.all(25),
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(10),
                                border: index == 0
                                    ? Border.all(color: successColor, width: 2)
                                    : Border()),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      alamat.labelAlamat!,
                                      style: tsLabelMediumBlueGrey,
                                    ),
                                    Spacer(),
                                    InkWell(
                                        onTap: () {},
                                        child: SvgPicture.asset(
                                            "assets/icons/icDotBold.svg"))
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  alamat.namaPenerima!,
                                  style: tsBodyMediumSemiboldBlueGrey,
                                ),
                                Text(
                                  alamat.noHp!,
                                  style: tsLabelMediumBlueGrey,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  alamat.alamatLengkap!,
                                  style: tsLabelMediumBlueGrey,
                                ),
                          
                                Spacer(),
                                Text(
                                  "Catatan : ${alamat.catatan!}",
                                  style: tsLabelSemiboldBlueGrey,
                                ),
                                              
                                index == 0
                                    ? Container(
                                        width: double.infinity,
                                        alignment: Alignment.topRight,
                                        child: Container(
                                          height: 20,
                                          width: 20,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: successColor),
                                        ),
                                      )
                                    : SizedBox()
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  } else {
                    return AlamatShimmer();
                  }
                },
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 55,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Tambahkan Alamat",
                    style: tsBodySmallSemiboldWhite,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}
