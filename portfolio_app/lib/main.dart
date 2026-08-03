import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/app_theme.dart';
import 'views/home_page.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Portfolio",
      theme: AppTheme.light,
      home: HomePage(),
    );
  }
}
