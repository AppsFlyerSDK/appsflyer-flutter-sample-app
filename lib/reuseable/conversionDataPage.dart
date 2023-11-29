import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:appsflyer_sample_app/utils/appsFlyerSDK.dart';
import 'package:appsflyer_sample_app/utils/varibles.dart';
import 'package:provider/provider.dart';

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
      body: context.watch<ConvDataProvider>().convData is Map<String, dynamic>
          ? Padding(
              padding: horizontalPagePadding,
              child: Expanded(
                child: ListView(
                  children: [
                    for (String key
                        in context.watch<ConvDataProvider>().convData.keys)
                      Wrap(
                        children: [
                          Text(
                            "$key: ",
                            style: const TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 18),
                          ),
                          Text(
                            context
                                .watch<ConvDataProvider>()
                                .convData[key]
                                .toString(),
                            style: const TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            )
          : const Text("No convresion data"),
    );
  }
}
