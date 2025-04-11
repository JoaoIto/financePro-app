import 'package:finance_pro_app/pages/home.dart';
import 'package:finance_pro_app/pages/login.dart';
import 'package:finance_pro_app/services/startScreen.service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const FinanceProApp());
}

class FinanceProApp extends StatelessWidget {
  const FinanceProApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FinancePro App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
      ),
      home: const StartScreen(), // verifica o token e direciona
      routes: {
        '/login': (_) => const LoginPage(),
        '/home': (context) {
          final token = ModalRoute.of(context)?.settings.arguments as String?;
          return HomePage(token: token);
        },
      },
    );
  }
}
