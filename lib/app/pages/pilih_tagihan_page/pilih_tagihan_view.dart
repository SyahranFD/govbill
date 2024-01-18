import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:govbill/app/pages/pilih_tagihan_page/widget/tagihan_card_widget.dart';
import 'package:govbill/common/helper/themes.dart';

class PilihTagihanPageView extends StatelessWidget {
  const PilihTagihanPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundPageColor,
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                "Pilih Tagihan",
                style: tsBodyLargeSemiboldBlack,
              ),
              Text(
                "Tagihan Apa yang ingin kamu tambahkan",
                style: tsLabelRegularBlack,
              ),
              SizedBox(
                height: 30,
              ),
              TagihanCardWidget(
                iconLeft: SvgPicture.asset("assets/icons/icKategoriMotor.svg"),
                titleLeft: "Pajak Motor",
                colorLeft: categoryMotor,
                iconRight: SvgPicture.asset("assets/icons/icKategoriMobil.svg"),
                titleRight: "Pajak Mobil",
                colorRight: categoryMobil,
              ),
              TagihanCardWidget(
                iconLeft: SvgPicture.asset("assets/icons/icKategoriPBB.svg"),
                titleLeft: "Pajak Bumi dan Bangunan",
                colorLeft: categoryPBB,
                iconRight: SvgPicture.asset("assets/icons/icKategoriPLN.svg"),
                titleRight: "Tagihan Listrik PLN",
                colorRight: categoryPLN,
              ),
              TagihanCardWidget(
                iconLeft: SvgPicture.asset("assets/icons/icKategoriPDAM.svg"),
                titleLeft: "Tagihan Air PDAM",
                colorLeft: categoryPDAM,
                iconRight: SvgPicture.asset("assets/icons/icKategoriPGN.svg"),
                titleRight: "Tagihan Gas PGN",
                colorRight: categoryPGN,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 90,
                  width: 90,
                  padding: EdgeInsets.all(23),
                  decoration: BoxDecoration(
                      color: categoryBPJS,
                      borderRadius: BorderRadius.circular(10)),
                  child: SvgPicture.asset("assets/icons/icKategoriBPJS.svg"),
                ),
              ),
              SizedBox(height: 10),
              Container(
                  width: 140,
                  alignment: Alignment.center,
                  child: Text(
                    "Tagihan BPJS Kesehatan",
                    style: tsBodyMediumSemiboldBlack,
                    textAlign: TextAlign.center,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
