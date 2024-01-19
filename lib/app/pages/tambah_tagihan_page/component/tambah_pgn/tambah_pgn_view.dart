import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:govbill/app/pages/tambah_tagihan_page/widget/button_widget.dart';
import 'package:govbill/app/pages/tambah_tagihan_page/widget/text_input_widget.dart';
import 'package:govbill/common/helper/themes.dart';

class TambahPgnView extends StatelessWidget {
  const TambahPgnView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundPageColor,
      appBar: AppBar(
        title: Text(
          "Daftarkan PGN",
          style: tsBodyLargeSemiboldBlack,
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/icons/icArrowBack.svg")),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              TextInputWidget(
                hintText: "Nama Tagihan",
                keyboard: TextInputType.name,
                height: 50,
                padding: EdgeInsets.only(top: 10, left: 15),
              ),
              SizedBox(
                height: 10,
              ),
              TextInputWidget(
                hintText: "ID Pelanggan",
                keyboard: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(11)
                ],
                height: 50,
                padding: EdgeInsets.only(top: 10, left: 15),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  "*ID Pelanggan Berjumlah 12 Digit",
                  style: tsLabelRegularRed,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 2),
                child: Text(
                  "Jadwalkan pembayaran untuk tagihan anda",
                  style: tsBodySmallRegularBlueGrey,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 2),
                child: Row(
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: ButtonWidget(
        onTap: () {},
        title: "Daftar",
        height: 55,
        width: double.infinity,
        alignment: Alignment.center,
        margin: EdgeInsets.all(15),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
