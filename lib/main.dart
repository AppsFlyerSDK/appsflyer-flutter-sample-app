import 'package:appsflyer_sample_app/pages/homePage.dart';
import 'package:appsflyer_sample_app/pages/apples.dart';
import 'package:appsflyer_sample_app/pages/bananas.dart';
import 'package:appsflyer_sample_app/pages/peaches.dart';
import 'package:appsflyer_sample_app/utils/appsFlyerSDKManager.dart';
import 'package:appsflyer_sample_app/utils/varibles.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final GoRouter routes = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          path: "apples",
          builder: (context, state) => const ApplesPage(),
        ),
        GoRoute(
          path: "bananas",
          builder: (context, state) => const BananasPage(),
        ),
        GoRoute(
          path: "peaches",
          builder: (context, state) => const PeachesPage(),
        )
      ],
    ),
  ],
  onException: (_, GoRouterState state, GoRouter router) {
    router.go('/');
  },
);

void main() {
  runApp(const MyApp());
  AppsflyerSDKManager();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp.router(
      routerConfig: routes,
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
