import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService {
  static Future<String?> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('https://finance-pro-mu.vercel.app/api/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['token'];
      }
    } catch (e) {
      print('Erro ao fazer login: $e');
    }

    return null;
  }
}
