import 'package:flutter/material.dart';
import 'package:appsflyer_sample_app/reuseable/fruitPage.dart';

class BananasPage extends StatelessWidget {
  const BananasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const FruitPage(
      sub1Value: "15",
      fruit: "bananas",
    );
  }
}
