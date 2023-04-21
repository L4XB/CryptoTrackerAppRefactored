import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:foodapp/common/theme/android/dark_theme.dart';
import 'package:foodapp/common/theme/android/light_theme.dart';
import 'package:foodapp/config/appConfig/appConfig.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:foodapp/views/errorPage_view/errorPage_view.dart';

class PlatformSwitch {
  ///[returns] right Widget based on Platform
  ///[startWidget] widget that should showed by starting the Application
  Widget getRightPlatformBasedWidget(Widget startWidget) {
    if (Platform.isAndroid) {
      return MaterialApp(
        //Config
        debugShowCheckedModeBanner: false,
        title: AppConfig().appName,
        home: startWidget,

        //Theme
        darkTheme: darkThemeAndroid,
        theme: lightThemeAndroid,

        //Language
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      );
    }
    if (Platform.isIOS) {
      return CupertinoApp(
        //Config
        home: startWidget,
        title: AppConfig().appName,
        debugShowCheckedModeBanner: false,

        //TO DO: Theaming

        //Language
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      );
    }
    return const ErrorPageView();
  }
}
