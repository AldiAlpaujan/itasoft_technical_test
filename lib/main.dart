import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:itasoft_technical_test/routes/app_pages.dart';
import 'package:itasoft_technical_test/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Technical Testing Itasoft",
      getPages: AppPages.pages,
      initialRoute: AppPages.initial,
      debugShowCheckedModeBanner: false,
      supportedLocales: AppTheme.supportedLocales,
      localizationsDelegates: AppTheme.localizationsDelegates,
      theme: ThemeData(
        useMaterial3: false,
        fontFamily: AppTheme.fontFamily,
        colorScheme: AppTheme.colorScheme,
        appBarTheme: AppTheme.appBarTheme,
        primaryColor: AppTheme.primaryColor,
        elevatedButtonTheme: AppTheme.btnTheme,
        scaffoldBackgroundColor: AppTheme.bgColor,
        floatingActionButtonTheme: AppTheme.floatBtnTheme,
      ),
    );
  }
}
