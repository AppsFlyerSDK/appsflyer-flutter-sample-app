import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:appsflyer_sample_app/utils/varibles.dart';

class ConversionDataPage extends StatelessWidget {
  const ConversionDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: colorAFBlue,
        title: SvgPicture.asset(
          "assets/images/appsflyer-logo.svg",
          // ignore: deprecated_member_use
          color: Colors.white,
          width: 130,
        ),
      ),
      body: const Text("No convesion data"),
    );
  }
}
