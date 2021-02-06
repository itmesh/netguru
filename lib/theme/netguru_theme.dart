import 'package:flutter/widgets.dart';
import 'package:netguru/theme/netguru_theme_data.dart';


class _NetguruTheme extends InheritedWidget {
  final Widget child;

  final _NetguruThemeState data;

  _NetguruTheme({@required this.data, this.child});

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}

class NetguruTheme extends StatefulWidget {
  final Widget child;
  final NetguruThemeData lightTheme;
  final NetguruThemeData darkTheme;
  final NetguruThemeMode themeMode;

  const NetguruTheme({
    Key key,
    this.child,
    this.lightTheme,
    this.themeMode,
    this.darkTheme,
  }) : super(key: key);

  @override
  _NetguruThemeState createState() => _NetguruThemeState(
        lightTheme,
        darkTheme,
        themeMode,
      );

  static NetguruThemeData of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_NetguruTheme>()
        .data
        .currentTheme;
  }

  static void setLightTheme(BuildContext context, {NetguruThemeData themeData}) {
    context
        .dependOnInheritedWidgetOfExactType<_NetguruTheme>()
        .data
        .updateThemeData(themeData, NetguruThemeMode.light);
  }

  static void setDarkTheme(BuildContext context, {NetguruThemeData themeData}) {
    context
        .dependOnInheritedWidgetOfExactType<_NetguruTheme>()
        .data
        .updateThemeData(themeData, NetguruThemeMode.dark);
  }
}

class _NetguruThemeState extends State<NetguruTheme> {
  NetguruThemeMode _themeMode;
  NetguruThemeData _darkTheme;
  NetguruThemeData _lightTheme;

  NetguruThemeData get currentTheme =>
      _themeMode == NetguruThemeMode.dark ? _darkTheme : _lightTheme;

  _NetguruThemeState(this._lightTheme, this._darkTheme, this._themeMode);

  void updateThemeData(NetguruThemeData data, NetguruThemeMode mode) {
    setState(() {
      _themeMode = mode;
      if (data != null) {
        if (mode == NetguruThemeMode.dark) {
          _darkTheme = data;
        } else {
          _lightTheme = data;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return _NetguruTheme(
      data: this,
      child: widget.child,
    );
  }
}

enum NetguruThemeMode {
  light,
  dark,
}
