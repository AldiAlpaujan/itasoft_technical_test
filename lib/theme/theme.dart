import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static const fontFamily = "Nunito";
  static const primaryColor = Color(0xFF6969F5);
  static const bgColor = Color(0xFFFFFFFF);
  static const secBgColor = Color(0xFFEEF2F8);
  static const borderColor = Color(0xFFEEF2F8);
  static const textFieldBorderColor = Color(0xFFD5D8E2);
  static const shadowColor = Color(0x18000000);
  static const titleColor = Color(0xFF252525);
  static const bodyColor = Color(0xFF455A64);
  static const capColor = Color(0xFF94A0B4);

  static const successColor = Color(0xFF6AB058);
  static const errorColor = Color(0xFFE53939);
  static const warningColor = Color(0xFFFF9046);

  static const padding = 20.0;

  static const localizationsDelegates = [
    GlobalWidgetsLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  static const supportedLocales = [
    Locale('en'),
    Locale('id'),
  ];
  static const titleDialogStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static const contentDialogStyle = TextStyle(fontSize: 14);

  static const contentPaddingDialog = EdgeInsets.fromLTRB(24, 12, 24, 8);

  static var colorScheme = ThemeData().colorScheme.copyWith(
        primary: primaryColor,
      );
  static var btnTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: primaryColor,
      textStyle: const TextStyle(color: Color(0xFFFFFFFF)),
    ),
  );
  static const floatBtnTheme = FloatingActionButtonThemeData(
    backgroundColor: primaryColor,
  );

  static const appBarTheme = AppBarTheme(
    color: primaryColor,
    elevation: 4,
    titleSpacing: 0,
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
  );

  static const btnStyle = TextStyle(
    fontSize: 16,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  static const _borderTextFieldInput = OutlineInputBorder(
    borderSide: BorderSide(
      color: AppTheme.textFieldBorderColor,
      width: 1,
    ),
  );

  static var textFieldInputDecoration = InputDecoration(
    isDense: true,
    border: _borderTextFieldInput,
    enabledBorder: _borderTextFieldInput,
    focusedBorder: _borderTextFieldInput.copyWith(
      borderSide: const BorderSide(
        color: AppTheme.primaryColor,
        width: 1,
      ),
    ),
    focusedErrorBorder: _borderTextFieldInput.copyWith(
      borderSide: const BorderSide(
        color: Colors.red,
        width: 1,
      ),
    ),
    contentPadding: const EdgeInsets.symmetric(
      vertical: 14,
      horizontal: 16,
    ),
    hintStyle: const TextStyle(
      color: AppTheme.capColor,
      fontSize: 12,
    ),
  );
}
