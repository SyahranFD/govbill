import 'package:flutter/material.dart';
import 'package:govbill/common/helper/themes.dart';

class HistoryPageView extends StatelessWidget {
  const HistoryPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundPageColor,
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("Halaman History"),
            ],
          ),
        ),
      ),
    );
  }
}
