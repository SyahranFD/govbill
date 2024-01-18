import 'package:flutter/material.dart';
import 'package:govbill/app/pages/home_page/components/home_category_component.dart';
import 'package:govbill/app/pages/home_page/components/home_total_tagihan_component.dart';
import 'package:govbill/common/helper/themes.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;

    return Scaffold(
      backgroundColor: backgroundPageColor,
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 60, left: width * 0.05, right: width * 0.05),
        child: SingleChildScrollView(
          child: Column(
            children: [
              HomeTotalTagihanComponent(),

              SizedBox(height: 30),

              HomeCategoryComponent()
            ],
          ),
        ),
      ),
    );
  }
}
