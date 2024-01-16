import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:govbill/app/pages/tambah_tagihan_page/widget/button_widget.dart';
import 'package:govbill/app/pages/tambah_tagihan_page/widget/text_input_widget.dart';
import 'package:govbill/common/helper/themes.dart';

class TambahMotorPageView extends StatelessWidget {
  const TambahMotorPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundPageColor,
      appBar: AppBar(
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
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              height: 50,
              padding: EdgeInsets.only(top: 10, left: 15),
            ),
            SizedBox(
              height: 10,
            ),
            TextInputWidget(
              hintText: "NRKB",
              height: 50,
              padding: EdgeInsets.only(top: 10, left: 15),
            ),
            SizedBox(
              height: 10,
            ),
            TextInputWidget(
              hintText: "No. Rangka",
              height: 50,
              padding: EdgeInsets.only(top: 10, left: 15),
            ),
          ],
        )),
      ),
      floatingActionButton: ButtonWidget(
        onTap: () {},
        title: "Verifikasi Motor",
        height: 55,
        width: double.infinity,
        alignment: Alignment.center,
        margin: EdgeInsets.all(15),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}