import 'package:flutter/material.dart';
import 'package:appsflyer_sample_app/reuseable/fruitPage.dart';

class PeachesPage extends StatelessWidget {
  const PeachesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FruitPage(fruit: "peaches");
  }
}
