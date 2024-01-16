import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:govbill/common/helper/themes.dart';

class TambahKartuPageView extends StatelessWidget {
  const TambahKartuPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    InputDecoration globalInputDecoration(String textHint, double width,
        double height, Color color, EdgeInsetsGeometry padding) {
      return InputDecoration(
        constraints: BoxConstraints(
            maxHeight: height,
            minHeight: height,
            minWidth: width ,
            maxWidth: width ),
        hintText: textHint,
        fillColor: color,
        filled: true,
        contentPadding: padding,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: secondaryColor, width: 2)),
        hintStyle: tsBodySmallMediumDarkGrey,
      );
    }
    return Scaffold( 
      backgroundColor: backgroundPageColor,
      appBar: AppBar(
        title: Text(
          "Tambah Kartu",
          style: tsBodyLargeSemiboldBlack,
        ),
        centerTitle: true,
        leading: InkWell(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset("assets/icons/icArrowBack.svg"),
          ),
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
                height: 15,
              ),
              TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: globalInputDecoration(
                      "Nomor Kartu Kredit/Debit",
                      double.infinity,
                      50,
                      primaryColor,
                      EdgeInsets.only(left: 15))),
              SizedBox(
                height: 10,
              ),
              SvgPicture.asset(
                "assets/images/card_provider.svg",
                height: 20,
                width: 20,
              ),
              Container(
                width: double.infinity,
                // height: 200,
                constraints:
                    BoxConstraints(maxHeight: double.infinity, minHeight: 100),
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Masa Berlaku",
                      style: tsBodySmallSemiboldBlueGrey,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Bulan",
                          style: tsLabelRegularBlueGrey,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        TextFormField(
                          cursorWidth: 2.0,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(2),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: globalInputDecoration(
                              "07", 60, 30, lightGrey, EdgeInsets.all(10)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Tahun",
                          style: tsLabelRegularBlueGrey,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        TextFormField(
                          cursorWidth: 2.0,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(2),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: globalInputDecoration(
                              "26", 60, 30, lightGrey, EdgeInsets.all(10)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "CVV",
                      style: tsBodySmallSemiboldBlueGrey,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        TextFormField(
                          cursorWidth: 2.0,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(2),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: globalInputDecoration(
                              "123", 70, 30, lightGrey, EdgeInsets.all(10)),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "*3 digit angka terakhir dibelakang kartu",
                          style: tsLabelRegularDarkGrey,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],

                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  height: 50,
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 15),
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Konfirmasi",
                    style: tsBodyMediumSemiboldWhite,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
