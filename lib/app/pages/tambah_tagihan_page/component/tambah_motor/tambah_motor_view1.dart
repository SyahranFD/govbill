import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:govbill/app/pages/index.dart';
import 'package:govbill/app/pages/tambah_tagihan_page/widget/button_widget.dart';
import 'package:govbill/app/pages/tambah_tagihan_page/widget/text_input_widget.dart';
import 'package:govbill/common/helper/themes.dart';

class TambahMotorPageView extends GetView<TambahTagihanPageController> {
  const TambahMotorPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final nikFormKey = GlobalKey<FormState>();
    final nrkbFormKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: backgroundPageColor,
      appBar: AppBar(
        backgroundColor: backgroundPageColor,
        title: Text(
          "Daftarkan Motor",
          style: tsBodyLargeSemiboldBlack,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("assets/icons/icArrowBack.svg"),
        ),
      ),
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            TextInputWidget(
              hintText: "NIK",
              keyboard: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(16)
              ],
              height: 50,
              padding: EdgeInsets.symmetric(vertical: 13, horizontal: 15),
              formKey: nikFormKey,
              validator: (value) {
                if (value!.isEmpty) {
                  return "NIK Tidak Boleh Kosong";
                } else {
                  controller.nik.value = value;
                }
                return null;
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextInputWidget(
              hintText: "NRKB",
              height: 50,
              padding: EdgeInsets.symmetric(vertical: 13, horizontal: 15),
              formKey: nrkbFormKey,
              validator: (value) {
                if (value!.isEmpty) {
                  return "NRKB Tidak Boleh Kosong";
                } else {
                  controller.nrkb.value = value;
                }
                return null;
              },
            ),
            SizedBox(
              height: 10,
            ),
          ],
        )),
      ),
      floatingActionButton: Obx(() => ButtonWidget(
            onTap: () {
              if (nikFormKey.currentState!.validate() &&
                  nrkbFormKey.currentState!.validate()) {
                controller.checkNik("motor");
              }
            },
            isLoading: controller.isLoading.value,
            title: "Verifikasi Motor",
            height: 55,
            width: double.infinity,
            alignment: Alignment.center,
            margin: EdgeInsets.all(15),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
