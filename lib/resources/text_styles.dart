import 'package:flutter/material.dart';
import 'package:netguru/resources/fonts.dart';

abstract class TextStyles {
  static final TextStyle _regular = TextStyle(
    fontFamily: Fonts.lemonada,
  );

  static final TextStyle title = _regular.copyWith(
    fontSize: 22.0,
    fontWeight: FontWeight.w500,
    height: 28 / 22,
  );

  static final TextStyle bodyBold = _regular.copyWith(
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    height: 18 / 16,
  );

  static final TextStyle caption = _regular.copyWith(
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    height: 14 / 12,
  );
}
