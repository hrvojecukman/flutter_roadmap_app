import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_roadmap/common/theme/app_sizes.dart';

mixin FlushBarUtils {
  Future<void> showErrorFlushBar({
    required BuildContext context,
    required String message,
    required String title,
  }) async {
    await _showFlushBar(
      message: message,
      context: context,
      title: title,
    );
  }

  Future<void> showInfoFlushBar({
    required BuildContext context,
    required String message,
    required String title,
  }) async {
    await _showFlushBar(
      message: message,
      context: context,
      title: title,
      color: Colors.red,
      textColor: Colors.white,
    );
  }

  Future<void> _showFlushBar({
    required BuildContext context,
    required String message,
    required String title,
    Color color = Colors.red,
    Color textColor = Colors.blue,
  }) async {
    return await Flushbar(
      flushbarStyle: FlushbarStyle.FLOATING,
      flushbarPosition: FlushbarPosition.TOP,
      titleText: Text(title, textAlign: TextAlign.center),
      messageText: Padding(
        padding: const EdgeInsets.only(top: AppSizes.smallSpacing),
        child: Text(message, textAlign: TextAlign.center),
      ),
      duration: flushBarDuration,
      borderRadius: appBorderRadius,
      backgroundColor: color,
      padding: appSmallPadding,
      margin: appSmallPadding,
    ).show(context);
  }
}
