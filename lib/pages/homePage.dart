import 'package:appsflyer_sample_app/main.dart';
import 'package:appsflyer_sample_app/utils/appsFlyerSDKManager.dart';
import 'package:appsflyer_sample_app/utils/varibles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    AppsflyerSDKManager().setupDeeplinkListener(routes);

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
      body: const Padding(
        padding: horizontalPagePadding,
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Gap(15),
                Text(
                  "OneLink \nSimulator",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 40, height: 1, fontWeight: FontWeight.w700),
                ),
                Text(
                  "Find the magic of deep link parameters",
                  style: TextStyle(
                    fontSize: 18,
                    height: 1.2,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Gap(15)
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Gap(5),
                  MyImageButton("Apples", "assets/images/apples.png", "/apples",
                      index: 0),
                  Gap(5),
                  MyImageButton(
                    "Bananas",
                    "assets/images/bananas.png",
                    "/bananas",
                    index: 1,
                  ),
                  Gap(5),
                  MyImageButton(
                    "Peaches",
                    "assets/images/peaches.png",
                    "/peaches",
                    index: 2,
                  ),
                  Gap(5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyImageButton extends StatelessWidget {
  final String title, imgPath, routePath;
  final int index;
  const MyImageButton(this.title, this.imgPath, this.routePath,
      {required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          animationDuration: Duration.zero,
          padding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
        ),
        onPressed: () {
          context.push(routePath);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              Image.asset(
                imgPath,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.fromLTRB(18, 5, 18, 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: colorAFDark,
                ),
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      )
          .animate(delay: (300 + 300 * index).ms)
          .moveY(begin: 10, end: 0, duration: 600.ms)
          .fade(),
    );
  }
}
