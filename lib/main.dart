import 'package:flutter/material.dart';

import 'package:netguru/features/splash/splash_page.dart';
import 'package:netguru/locator/service_locator.dart';
import 'package:netguru/theme/netguru_theme.dart';
import 'package:netguru/theme/netguru_theme_data.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _materialAppKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.window.onPlatformBrightnessChanged = () {
      if (WidgetsBinding.instance.window.platformBrightness ==
          Brightness.dark) {
        NetguruTheme.setDarkTheme(_materialAppKey.currentContext);
      } else {
        NetguruTheme.setLightTheme(_materialAppKey.currentContext);
      }
    };
  }

  @override
  Widget build(_) {
    return NetguruTheme(
      themeMode:
          WidgetsBinding.instance.window.platformBrightness == Brightness.dark
              ? NetguruThemeMode.dark
              : NetguruThemeMode.light,
      darkTheme: netguruDarkThemeData,
      lightTheme: netguruLightThemeData,
      child: Builder(
        builder: (ctx) => MaterialApp(
          key: _materialAppKey,
          themeMode:
              NetguruTheme.of(ctx).darkMode ? ThemeMode.dark : ThemeMode.light,
          darkTheme: ThemeData(
            primaryColor: NetguruTheme.of(ctx).primaryColor,
            scaffoldBackgroundColor: NetguruTheme.of(ctx).backgroundColor,
            cardColor: NetguruTheme.of(ctx).primaryColor,
          ),
          theme: ThemeData(
            primaryColor: NetguruTheme.of(ctx).primaryColor,
            scaffoldBackgroundColor: NetguruTheme.of(ctx).backgroundColor,
            cardColor: NetguruTheme.of(ctx).sheetColor,
          ),
          home: SplashPage(),
        ),
      ),
    );
  }
}
