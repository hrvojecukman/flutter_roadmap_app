import 'package:flutter/material.dart';

class AppSizes {
  static const double smallSpacing = 12;
  static const double spacing = 24;
  static const double largeSpacing = 48;
  static const double buttonHeight = 36;
  static const double largeButtonHeight = 66;
  static const double spacingFromBottom = 102;
  static const double borderRadius = 12.0;
  static const double pageIndicatorRadius = 12.0;
  static const double tutorialTileHeight = 180.0;
}

final appBorderRadius = BorderRadius.circular(AppSizes.borderRadius);
final appShape = RoundedRectangleBorder(borderRadius: appBorderRadius);
const appPadding = EdgeInsets.all(AppSizes.spacing);
const appSmallPadding = EdgeInsets.all(AppSizes.smallSpacing);

const flushBarDuration = Duration(seconds: 3);
