import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:govbill/common/helper/themes.dart';

class TagihanTerdaftarPBB extends StatelessWidget {

  const TagihanTerdaftarPBB({Key? key}) : super(key: key);

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
          Container(
            margin: EdgeInsets.only(top: 15, bottom: 20, left: 15, right: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("NOP : 3118903000403101740", style: tsLabelRegularDarkBlue),
                    SvgPicture.asset(
                      "assets/icons/icMenu.svg",
                      width: 16,
                    ),
                  ],
                ),

                SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: categoryPBB,
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
                        "assets/icons/icKategoriPBB.svg",
                        width: 24,
                      ),
                    ),
                    SizedBox(width: width * 0.04),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: width * 0.685,
                            child: Text("Pajak Rumah", style: tsBodySmallSemiboldBlack)
                        ),
                        SizedBox(height: 4),
                        Text("Terjadwal dibayar setiap tanggal 15", style: tsLabelRegularBlack),
                      ],
                    )
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