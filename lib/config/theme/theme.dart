import 'package:flutter/material.dart';
import 'package:login_template_firebase/config/theme/app_colors.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.grey,
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Montserrat', //3
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        buttonColor: AppColors.black,
      ),
    );
  }
}
