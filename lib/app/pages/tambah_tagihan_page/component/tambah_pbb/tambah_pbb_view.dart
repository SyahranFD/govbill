import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:govbill/app/pages/tambah_tagihan_page/widget/button_widget.dart';
import 'package:govbill/app/pages/tambah_tagihan_page/widget/text_input_widget.dart';
import 'package:govbill/common/helper/themes.dart';

class TambahPbbView extends StatelessWidget {
  const TambahPbbView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundPageColor,
      appBar: AppBar(
        title: Text(
          "Daftarkan PBB",
          style: tsBodyLargeSemiboldBlack,
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/icons/icArrowBack.svg")),
      ),
      body: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 15),
          height: double.infinity,
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 15,
              ),
              TextInputWidget(
                hintText: "Nama Tagihan",
                height: 50,
                padding: EdgeInsets.only(top: 10, left: 15),
              ),
              SizedBox(
                height: 10,
              ),
              TextInputWidget(
                hintText: "Nama Kabupaten",
                height: 50,
                padding: EdgeInsets.only(top: 10, left: 15),
              ),
              SizedBox(
                height: 10,
              ),
              TextInputWidget(
                hintText: "Nomor Objek Pajak (NOP)",
                height: 50,
                padding: EdgeInsets.only(top: 10, left: 15),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  "*NOP berjumlah 18 digit",
                  style: tsLabelRegularRed,
                ),
              ),
              SizedBox(
                height: 25,
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
            ]),
          )),
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
