import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:netguru/resources/netguru_colors.dart';

class NetguruThemeData {
  final Color primaryColor;
  final Color secondaryColor;
  final Color backgroundColor;
  final Color sheetColor;
  final bool darkMode;

  NetguruThemeData({
    this.primaryColor,
    this.secondaryColor,
    this.backgroundColor,
    this.sheetColor,
    this.darkMode,
  });

  NetguruThemeData copyWith({
    Color primaryColor,
    Color secondaryColor,
    Color sheetColor,
    bool darkMode,
  }) {
    return NetguruThemeData(
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      sheetColor: sheetColor ?? this.sheetColor,
      darkMode: darkMode ?? this.darkMode,
    );
  }
}

final netguruLightThemeData = NetguruThemeData(
  primaryColor: NetguruColors.ltPrimary,
  secondaryColor: NetguruColors.ltSecondary,
  sheetColor: NetguruColors.ltSheet,
  backgroundColor: NetguruColors.ltBackground,
  darkMode: false,
);

final netguruDarkThemeData = NetguruThemeData(
  primaryColor: NetguruColors.dtPrimary,
  secondaryColor: NetguruColors.dtSecondary,
  sheetColor: NetguruColors.dtSheet,
  backgroundColor: NetguruColors.dtBackground,
  darkMode: true,
);
