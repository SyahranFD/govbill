import 'package:flutter/material.dart';
import 'package:govbill/common/helper/themes.dart';

class ArsipMetodePembayaranPageView extends StatelessWidget {
  const ArsipMetodePembayaranPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundPageColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundPageColor,
        toolbarHeight: 75,
        centerTitle: true,
        title: Text("Metode Pembayaran", style: tsBodyLargeSemiboldBlack),
      ),
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Container(
                height: 65,
                decoration: BoxDecoration(
                    color: categoryMobil,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/icons/icMoney.png",
                      height: 50,
                      width: 55,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Pembayaran Secara Otomatis",
                          style: tsBodySmallSemiboldWhite,
                        ),
                        Text(
                          "Pembayaran akan dicatat di history pembayaran",
                          style: tsLabelRegularWhite,
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 50,
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                    color: warningColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/icons/icAlert.png",
                      height: 20,
                      width: 55,
                    ),
                    Text(
                      "Tambahkan metode sebagai saldo cadangan",
                      style: tsLabelRegularWhite,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ListView.builder(
                itemCount: 5,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    height: index == 0 ? 160 : 110,
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        index == 0
                            ? Container(
                          height: 50,
                          padding: EdgeInsets.only(top: 15),
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                    color: smoothGreen,
                                    borderRadius:
                                    BorderRadius.circular(10)),
                                child: Text(
                                  "Pembayaran Utama",
                                  style: tsLabelSemiboldWhite,
                                ),
                              ),
                              Spacer(),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.more_vert))
                            ],
                          ),
                        )
                            : SizedBox(),
                        Container(
                          height: 110,
                          child: Row(
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        "assets/images/gopay2.png",
                                      ),
                                    )),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "*********6743",
                                    style: tsLabelMediumBlueGrey,
                                  ),
                                  Text(
                                    "Gatot Supadio",
                                    style: tsLabelMediumBlueGrey,
                                  ),
                                  Text(
                                    "Saldo : Rp 320.000",
                                    style: tsBodySmallSemiboldBlack,
                                  )
                                ],
                              ),
                              Spacer(),
                              index == 0
                                  ? SizedBox()
                                  : IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.more_vert))
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
              GestureDetector(
                child: Container(
                  height: 50,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Tambahkan Metode Pembayaran Lain",
                    style: tsBodySmallSemiboldWhite,
                  ),
                ),
              ),
              SizedBox(
                height: 35,
              )
            ],
          ),
        ),
      ),
    );
  }
}
