import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:govbill/common/helper/themes.dart';

class CardTagihanAkanDatangPGN extends StatelessWidget {

  CardTagihanAkanDatangPGN(
      {Key? key,
        required this.noTagihan,
        required this.jenisTagihan,
        required this.namaTagihan,
        required this.waktuBayar,
        required this.nominalTagihan,
      });

  final String? noTagihan;
  final String? jenisTagihan;
  final String? namaTagihan;
  final String? waktuBayar;
  final String? nominalTagihan;

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            bottom: 0,
            child: SvgPicture.asset(
              "assets/icons/icShadow$jenisTagihan.svg",
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15, bottom: 20, left: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("ID Pelanggan : $noTagihan", style: tsLabelRegularDarkBlue),

                SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: categoryPGN,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x19000000),
                            blurRadius: 10,
                            offset: Offset(0, 0),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      width: width * 0.1,
                      height: width * 0.1,
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        "assets/icons/icKategori$jenisTagihan.svg",
                        width: 24,
                      ),
                    ),
                    SizedBox(width: width * 0.04),
                    Container(
                      width: width * 0.7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("$namaTagihan", style: tsBodySmallSemiboldBlack),
                          SizedBox(height: 4),
                          Text("Akan dibayar tanggal $waktuBayar", style: tsLabelRegularBlack),
                          SizedBox(height: 4),
                          Text("$nominalTagihan", style: tsLabelRegularRed),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}