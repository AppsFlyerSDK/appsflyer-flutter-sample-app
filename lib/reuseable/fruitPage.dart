import 'package:appsflyer_sample_app/reuseable/conversionDataPage.dart';
import 'package:appsflyer_sample_app/utils/appsFlyerSDK.dart';
import 'package:appsflyer_sample_app/utils/varibles.dart';
import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class FruitPage extends StatelessWidget {
  final String fruit;

  FruitPage({super.key, required this.fruit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 70,
        color: Colors.transparent,
        child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ConversionDataPage()),
            );
          },
          child: const Text(
            "Show conversion data",
            style: TextStyle(
              fontSize: 24,
              color: colorAFBlue,
            ),
          ),
        ),
      ),
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
      body: deepLinkData?.deepLinkValue == fruit ||
              deepLinkData?.clickEvent["fruit_name"] == fruit
          ? Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset("assets/images/$fruit.png"),
                    deepLinkData?.deepLinkValue != null
                        ? Text(
                            deepLinkData!.clickEvent["deep_link_sub1"],
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 32,
                            ),
                          )
                        : Text(
                            deepLinkData!.clickEvent["fruit_amount"],
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 32,
                            ),
                          ),
                  ],
                ),
                Expanded(
                  child: ListView(
                    padding: horizontalPagePadding,
                    children: [
                      for (String key in deepLinkData!.clickEvent.keys)
                        Wrap(
                          children: [
                            Text(
                              "$key: ",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 18),
                            ),
                            Text(
                              deepLinkData!.clickEvent[key].toString(),
                              style: const TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorAFBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: () {
                    print("copy link");
                  },
                  icon: const Icon(
                    Icons.copy,
                    size: 24.0,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'Copy link',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset("assets/images/$fruit.png"),
                const Center(
                  child: Text(
                    "No deep link happened",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorAFBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: () {
                    print("copy link");
                  },
                  icon: const Icon(
                    Icons.copy,
                    size: 24.0,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'Copy link',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
