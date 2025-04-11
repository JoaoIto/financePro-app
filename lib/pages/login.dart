import 'package:flutter/material.dart';

import '../services/auth.service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String? error;
  bool loading = false;

  Future<void> login() async {
    setState(() {
      loading = true;
      error = null;
    });

    final token = await AuthService.login(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

    if (token != null) {
      // Aqui vai navegação para a próxima página
      Navigator.pushReplacementNamed(context, '/home', arguments: token);
    } else {
      setState(() {
        error = 'Login inválido';
      });
    }

    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.attach_money, size: 80, color: Colors.green),
              const SizedBox(height: 16),
              const Text(
                'FinancePro - App 💵',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF18428F),
                ),
              ),
              const SizedBox(height: 32),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Senha',
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: loading ? null : login,
                  icon: const Icon(Icons.login),
                  label: Text(loading ? 'Entrando...' : 'Entrar'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF18428F),
                  ),
                ),
              ),
              if (error != null) ...[
                const SizedBox(height: 12),
                Text(
                  error!,
                  style: const TextStyle(color: Colors.red),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
