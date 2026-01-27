import 'package:http/http.dart' as http;
import 'dart:convert';
import 'api_constants.dart';

class AuthService {
  Future<Map<String, dynamic>> signup(
    String name,
    String email,
    String password,
  ) async {
    final url = Uri.parse('$baseUrl/api/auth/signup');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'name': name, 'email': email, 'password': password}),
    );
    return jsonDecode(response.body);
  }
}
