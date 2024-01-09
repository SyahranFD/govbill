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
                height: 55,
              ),
              TagihanCardWidget(
                iconLeft: SvgPicture.asset("assets/icons/icMotor.svg"),
                titleLeft: "Pajak Motor",
                colorLeft: categoryMotor,
                iconRight: SvgPicture.asset("assets/icons/icMobil.svg"),
                titleRight: "Pajak Mobil",
                colorRight: categoryMobil,
              ),
              TagihanCardWidget(
                iconLeft: SvgPicture.asset("assets/icons/icPBB.svg"),
                titleLeft: "Pajak Bumi dan Bangunan",
                colorLeft: categoryPBB,
                iconRight: SvgPicture.asset("assets/icons/icPLN.svg"),
                titleRight: "Tagihan Listrik PLN",
                colorRight: categoryPLN,
              ),
              TagihanCardWidget(
                iconLeft: SvgPicture.asset("assets/icons/icPDAM.svg"),
                titleLeft: "Tagihan Air PDAM",
                colorLeft: categoryPDAM,
                iconRight: SvgPicture.asset("assets/icons/icPGN.svg"),
                titleRight: "Tagihan Gas PGN",
                colorRight: categoryPGN,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 100,
                  width: 100,
                  padding: EdgeInsets.all(25),
                  decoration: BoxDecoration(
                      color: categoryBPJS,
                      borderRadius: BorderRadius.circular(10)),
                  child: SvgPicture.asset("assets/icons/icBPJS.svg"),
                ),
              ),
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
