import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:govbill/app/pages/tambah_tagihan_page/widget/button_widget.dart';
import 'package:govbill/app/pages/tambah_tagihan_page/widget/text_input_widget.dart';
import 'package:govbill/common/helper/themes.dart';

class TambahMotorKonfirmasiView extends StatelessWidget {
  const TambahMotorKonfirmasiView({super.key});

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                "Jadwalkan pembayaran untuk tagihan anda",
                style: tsBodySmallRegularBlueGrey,
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    "Tanggal",
                    style: tsBodySmallSemiboldBlueGrey,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  TextInputWidget(
                    height: 35,
                    width: 60,
                    hintText: "20",
                    keyboard: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(2),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    padding: EdgeInsets.only(top: 10, left: 15),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Text(
                    "Bulan",
                    style: tsBodySmallSemiboldBlueGrey,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  TextInputWidget(
                    height: 35,
                    width: 60,
                    hintText: "10",
                    keyboard: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(2),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    padding: EdgeInsets.only(top: 10, left: 15),
                  )
                ],
              ),
              SizedBox(
                height: 35,
              ),
              Text(
                "Masukkan alamat untuk mengirim TBPKP",
                style: tsBodySmallRegularBlueGrey,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 20),
                // constraints: BoxConstraints(minHeight: 50, maxHeight: 150),
                height: 140,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Container(
                      width: Get.width * 0.7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Rumah - Fadhil Rafa (085123456789)",
                            style: tsBodySmallSemiboldBlueGrey,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Jalan Sukun Raya No.09, Besito Kulon, Besito, Kec. Gebog, Kabupaten Kudus, Jawa Tengah 59333",
                            style: tsLabelRegularDarkGrey,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Catatan : cat merah hitam, gerbang biru",
                            style: tsLabelSemiboldBlueGrey,
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Transform.rotate(
                      angle: 3.14 / 1,
                      child: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset("assets/icons/icArrowBack.svg"),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: ButtonWidget(
        onTap: () {},
        title: "Simpan",
        height: 55,
        width: double.infinity,
        alignment: Alignment.center,
        margin: EdgeInsets.all(15),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
