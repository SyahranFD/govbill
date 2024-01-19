import 'package:flutter/material.dart';
import 'package:govbill/common/helper/themes.dart';

class MetodePembayaranPageView extends StatelessWidget {
  const MetodePembayaranPageView({Key? key}) : super(key: key);

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
        title: Text("Metode Pembayaran", style: tsBodyLargeSemiboldBlack),
      ),
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 15),
              ListView.builder(
                itemCount: 5,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
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
                                padding: EdgeInsets.only(top: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 20),
                                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                      decoration: BoxDecoration(
                                          color: smoothGreen,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Text(
                                        "Pembayaran Utama",
                                        style: tsLabelSemiboldWhite,
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.more_vert))
                                  ],
                                ),
                              )
                            : SizedBox(),
                        Container(
                          height: 100,
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
              InkWell(
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
