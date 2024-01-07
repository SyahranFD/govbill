import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:govbill/app/pages/tambah_alamat_page/widget/tambah_alamat_form.dart';
import 'package:govbill/common/helper/themes.dart';

class TambahAlamatPageView extends StatelessWidget {
  const TambahAlamatPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundPageColor,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: backgroundPageColor,
        elevation: 0,
        title: Text(
          'Tambahkan Alamat',
          style: tsBodyLargeSemiboldBlack,
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () => Get.back(),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: SvgPicture.asset(
              'assets/icons/icArrowBack.svg',
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              TextfieldTambahAlamat(
                obscureText: false,
                hintText: 'Nama Penerima',
                keyboardType: TextInputType.text,
              ),
              TextfieldTambahAlamat(
                obscureText: false,
                hintText: 'No. Hp',
                keyboardType: TextInputType.text,
              ),
              TextfieldTambahAlamat(
                obscureText: false,
                hintText: 'Label Alamat',
                keyboardType: TextInputType.text,
              ),
              TextfieldTambahAlamat(
                obscureText: false,
                hintText: 'Alamat Lengkap',
                keyboardType: TextInputType.text,
              ),
              TextfieldTambahAlamat(
                obscureText: false,
                hintText: 'Catatan Untuk Kurir',
                keyboardType: TextInputType.text,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Container(
          width: MediaQuery.of(context).size.width - 30,
          height: 70,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: secondaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Text(
              'Simpan',
              style: tsBodyMediumSemiboldWhite,
            ),
          ),
        ),
      ),
    );
  }
}
