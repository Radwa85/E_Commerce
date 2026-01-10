import 'package:e_commerce/core/theme/app_theme.dart';
import 'package:e_commerce/features/login/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce',
      theme: AppTheme.lightTheme,

      home: const LoginScreen(),
    );
  }
}

