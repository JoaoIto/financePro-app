import 'package:http/http.dart' as http;

class TransactionService {
  static const _baseUrl = 'https://finance-pro-mu.vercel.app/api';

  static Future<void> fetchTransactions(String token) async {
    final res = await http.get(
      Uri.parse('$_baseUrl/transactions'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (res.statusCode == 200) {
      print('Transactions: ${res.body}');
    } else {
      throw Exception('Erro ao buscar transações');
    }
  }
}
