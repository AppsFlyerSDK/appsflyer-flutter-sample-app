import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void appsFlyerSDKInitializer() {
  appsflyerSdk.initSdk(
    registerConversionDataCallback: true,
    registerOnDeepLinkingCallback: true,
  );
}

AppsFlyerOptions appsFlyerOptions = AppsFlyerOptions(
  appInviteOneLink: "27kG",
  afDevKey: "sQ84wpdxRTR4RMCaE9YqS4",
  appId: "id1292821412",
  showDebug: true,
);

AppsflyerSdk appsflyerSdk = AppsflyerSdk(appsFlyerOptions);

DeepLink? deepLinkData;
  var convData;

