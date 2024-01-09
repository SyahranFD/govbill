import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:govbill/app/pages/tagihan_akan_datang_page/components/card_tagihan_akan_datang_bpjs.dart';
import 'package:govbill/app/pages/tagihan_akan_datang_page/components/card_tagihan_akan_datang_mobil.dart';
import 'package:govbill/app/pages/tagihan_akan_datang_page/components/card_tagihan_akan_datang_motor.dart';
import 'package:govbill/app/pages/tagihan_akan_datang_page/components/card_tagihan_akan_datang_pbb.dart';
import 'package:govbill/app/pages/tagihan_akan_datang_page/components/card_tagihan_akan_datang_pdam.dart';
import 'package:govbill/app/pages/tagihan_akan_datang_page/components/card_tagihan_akan_datang_pln.dart';
import 'package:govbill/common/helper/themes.dart';

class TagihanAkanDatangPageView extends StatelessWidget {
  const TagihanAkanDatangPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;

    return Scaffold(
      backgroundColor: backgroundPageColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundPageColor,
        toolbarHeight: 75,
        centerTitle: true,
        title: Text("Tagihan Akan Datang", style: tsBodyLargeSemiboldBlack),
        leading: IconButton(
          onPressed: () => Get.back,
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 20,
            color: blackColor,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 15, left: width * 0.05, right: width * 0.05),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CardTagihanAkanDatangPLN(idPelanggan: '535643160132', jenisTagihan: 'PLN', namaPelanggan: 'Gatot Supiadi', waktuBayar: '15 Agustus 2023', hargaRupiah: 'Rp 100.000'),
              CardTagihanAkanDatangBPJS(noVA: '535643160132', jenisTagihan: 'BPJS', namaPelanggan: 'Gatot Supiadi', waktuBayar: '15 Agustus 2023', hargaRupiah: 'Rp 100.000'),
              CardTagihanAkanDatangMotor(noRangka: '535643160132', jenisTagihan: 'Motor', platNomer: 'H8976JP', waktuBayar: '15 Agustus 2023', hargaRupiah: 'Rp 100.000'),
              CardTagihanAkanDatangMobil(noRangka: '535643160132', jenisTagihan: 'Mobil', platNomer: 'H8976JP', waktuBayar: '15 Agustus 2023', hargaRupiah: 'Rp 100.000'),
              CardTagihanAkanDatangPBB(nop: '535643160132', jenisTagihan: 'PBB', namaPemilik: 'Gatot Supiadi', waktuBayar: '15 Agustus 2023', hargaRupiah: 'Rp 100.000'),
              CardTagihanAkanDatangPDAM(noPelanggan: '535643160132', jenisTagihan: 'PDAM', namaPelanggan: 'Gatot Supiadi', waktuBayar: '15 Agustus 2023', hargaRupiah: 'Rp 100.000'),
            ],
          ),
        ),
      ),
    );
  }
}