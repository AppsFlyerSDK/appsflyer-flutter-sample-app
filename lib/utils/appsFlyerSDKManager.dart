import 'dart:async';
import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class AppsflyerSDKManager {
  static final AppsflyerSDKManager _instance = AppsflyerSDKManager._internal();

  factory AppsflyerSDKManager() {
    return _instance;
  }

  AppsflyerSDKManager._internal() {
    _initializeSDK();
  }

  AppsflyerSdk? _appsflyerSdk;
  Future<Map<String, dynamic>>? _conversionDataFuture;
  DeepLink? deepLinkData;

  void _initializeSDK() {
    _appsflyerSdk = AppsflyerSdk(
      AppsFlyerOptions(
        appInviteOneLink: "27kG",
        afDevKey: "sQ84wpdxRTR4RMCaE9YqS4",
        appId: "id1292821412",
        showDebug: true,
      ),
    );

    _appsflyerSdk?.initSdk(
      registerConversionDataCallback: true,
      registerOnDeepLinkingCallback: true,
    );

    _conversionDataFuture = _setupConversionDataListener();
  }

  Future<Map<String, dynamic>> _setupConversionDataListener() {
    Completer<Map<String, dynamic>> completer =
        Completer<Map<String, dynamic>>();

    _appsflyerSdk?.onInstallConversionData((res) {
      Map<String, dynamic> convData = res["payload"];
      completer.complete(convData);
    });

    return completer.future;
  }

  Future<Map<String, dynamic>>? get conversionDataFuture =>
      _conversionDataFuture;

  void setupDeeplinkListener(GoRouter router) {
    _appsflyerSdk?.onDeepLinking((res) {
      switch (res.status) {
        case Status.FOUND:
          debugPrint("deeplink happend res: ${res.deepLink}");
          deepLinkData = res.deepLink;
          String? navigateTo;
          if (deepLinkData?.deepLinkValue != null) {
            navigateTo = deepLinkData?.deepLinkValue;
          } else if (deepLinkData?.getStringValue("fruit_name") != null) {
            navigateTo = deepLinkData?.getStringValue("fruit_name");
          } else {
            throw "No deepLinkValue or fruit_name";
          }
          try {
            switch (navigateTo) {
              case "apples":
                router.push("/apples");
                break;
              case "bananas":
                router.push("/bananas");
                break;
              case "peaches":
                router.push("/peaches");
                break;
            }
          } catch (e) {
            debugPrint("Navigation error: $e");
          }
          break;
        case Status.NOT_FOUND:
          debugPrint("deep link not found");
          break;
        case Status.ERROR:
          debugPrint("deep link error: ${res.error}");
          break;
        case Status.PARSE_ERROR:
          debugPrint("deep link status parsing error");
          break;
      }
    });
  }

  void generateInviteLink({required fruit, required sub1Value}) {
    _appsflyerSdk?.generateInviteLink(
        AppsFlyerInviteLinkParams(
            baseDeepLink: "flutter-onelink-app.onelink.me",
            customParams: {
              "deep_link_value": fruit,
              "deep_link_sub1": sub1Value,
              "deep_link_sub2": "THIS_USER_ID",
            }), (result) {
      Clipboard.setData(
          ClipboardData(text: result["payload"]["userInviteURL"]));
    }, (error) {
      debugPrint("error-123 $error");
    });
  }
}
