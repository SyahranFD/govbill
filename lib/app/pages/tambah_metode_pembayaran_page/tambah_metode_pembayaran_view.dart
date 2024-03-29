import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:govbill/app/pages/tambah_metode_pembayaran_page/widget/tambah_metode_pembayaran_card_widget.dart';
import 'package:govbill/common/helper/themes.dart';

class TambahMetodePembayaranPageView extends StatelessWidget {
  const TambahMetodePembayaranPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundPageColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundPageColor,
        toolbarHeight: 75,
        centerTitle: true,
        title: Text("Tambah Metode Pembayaran", style: tsBodyLargeSemiboldBlack),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 20,
            color: blackColor,
          ),
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
              PembayaranCard(
                title: "Tambahkan Gopay",
                iconPrefix: Image.asset("assets/images/gopay.png"),
              ),
              PembayaranCard(
                title: "Tambahkan OVO",
                iconPrefix: Image.asset("assets/images/ovo.png"),
              ),
              PembayaranCard(
                title: "Tambahkan DANA",
                iconPrefix: Image.asset("assets/images/dana.png"),
              ),
              PembayaranCard(
                title: "Tambahkan Kartu Kredit/Debit",
                iconPrefix: Image.asset("assets/images/card.png"),
                route: "/tambah-kartu",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
