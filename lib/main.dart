import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:appsflyer_sample_app/utils/varibles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
      title: 'One Link AppsFlyer',
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: colorAFDark,
          ),
        ),
        primaryColor: colorAFBlue,
        fontFamily: "Inter",
        useMaterial3: true,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
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
      body: Padding(
        padding: horizontalPagePadding,
        child: Column(
          children: [
            const Column(
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
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Gap(5),
                TextButton(
                  style: TextButton.styleFrom(
                    animationDuration: Duration.zero,
                    padding: EdgeInsets.zero,
                    backgroundColor: Colors.transparent,
                  ),
                  onPressed: () {
                    print("navigate");
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Image.asset(
                          "assets/images/apples.png",
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
                          child: const Text(
                            "Apples Title",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
