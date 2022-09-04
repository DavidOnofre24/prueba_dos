import 'package:flutter/material.dart';
import 'package:prueba_dos/pages/home_products_page.dart';
import 'package:prueba_dos/resources/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'prueba_dos',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            appBarTheme: const AppBarTheme(color: AppColors.appBarColor)),
        home: const HomeProducts());
  }
}
