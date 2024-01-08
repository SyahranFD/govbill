import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:govbill/common/helper/themes.dart';

class DetailMotorPageView extends StatelessWidget {
  const DetailMotorPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundPageColor,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: backgroundPageColor,
        elevation: 0,
        title: Text(
          'Detail Motor',
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
      body: Center(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              width: 116,
              height: 116,
              margin: EdgeInsets.only(
                top: 50,
              ),
              decoration: BoxDecoration(
                color: categoryMotor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: SvgPicture.asset(
                'assets/icons/icMotor.svg',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'H 1234 AB',
              style: tsBodyLargeSemiboldBlack,
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 350,
              height: 310,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nama Pemilik',
                            style: tsBodySmallSemiboldBlack,
                          ),
                          Text(
                            'Radya Hukma Shabiyyaa Harbani',
                            style: tsLabelRegularBlack,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Merk Motor',
                            style: tsBodySmallSemiboldBlack,
                          ),
                          Text(
                            'Honda Beat Street',
                            style: tsLabelRegularBlack,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nomor Rangka',
                            style: tsBodySmallSemiboldBlack,
                          ),
                          Text(
                            'MH1JF8110LK100001',
                            style: tsLabelRegularBlack,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Alamat Pengiriman TBPKP',
                            style: tsBodySmallSemiboldBlack,
                          ),
                          Text(
                            'Jalan Sukun Raya No.09, Besito Kulon, Besito, Kec. Gebog, Kabupaten Kudus, Jawa Tengah 59333',
                            style: tsLabelRegularBlack,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
