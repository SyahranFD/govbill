import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:govbill/common/helper/themes.dart';

class DaftarAlamatPageView extends StatelessWidget {
  const DaftarAlamatPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundPageColor,
      appBar: AppBar(
        title: Text(
          "Daftar Alamat",
          style: tsBodyLargeSemiboldBlack,
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {},
          child: Padding(
              padding: EdgeInsets.all(10),
              child: SvgPicture.asset("assets/icons/icArrowBack.svg")),
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
              ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    width: double.infinity,
                    height: 200,
                    margin: EdgeInsets.only(bottom: 15),
                    padding: EdgeInsets.all(25),
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(10),
                        border: index == 0
                            ? Border.all(color: successColor, width: 2)
                            : Border()),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Rumah",
                              style: tsLabelMediumBlueGrey,
                            ),
                            Spacer(),
                            InkWell(
                                onTap: () {},
                                child: SvgPicture.asset(
                                    "assets/icons/icDotBold.svg"))
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Ahmad Pradipta",
                          style: tsBodyMediumSemiboldBlueGrey,
                        ),
                        Text(
                          "+628156241839",
                          style: tsLabelMediumBlueGrey,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Jalan Sukun Raya No.09, Besito Kulon, Besito, Kec. Gebog, Kabupaten Kudus, Jawa Tengah 59333",
                          style: tsLabelMediumBlueGrey,
                        ),
                        Spacer(),
                        Text(
                          "Catatan : cat merah hitam, gerbang biru",
                          style: tsLabelSemiboldBlueGrey,
                        ),
                        index == 0
                            ? Container(
                                width: double.infinity,
                                alignment: Alignment.topRight,
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: successColor),
                                ),
                              )
                            : SizedBox()
                      ],
                    ),
                  );
                },
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 55,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Tambahkan Alamat",
                    style: tsBodySmallSemiboldWhite,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}
