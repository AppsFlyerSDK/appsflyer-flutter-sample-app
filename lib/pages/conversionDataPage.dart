import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:appsflyer_sample_app/utils/appsFlyerSDKManager.dart';
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
      body: Container(
        padding: horizontalPagePadding,
        child: const ConversionData(),
      ),
    );
  }
}

class ConversionData extends StatelessWidget {
  const ConversionData({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: AppsflyerSDKManager().conversionDataFuture,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        } else if (snapshot.hasData) {
          List<Widget> widgets = [];
          for (String key in snapshot.data!.keys) {
            widgets.add(
              Wrap(
                children: [
                  Text(
                    "$key: ",
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    snapshot.data![key].toString(),
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            );
          }
          return ListView(
            children: widgets,
          );
        } else {
          return const Text("loading data...");
        }
      },
    );
  }
}
