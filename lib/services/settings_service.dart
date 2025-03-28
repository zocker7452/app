
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'auth_service.dart';

class SettingsService {
  static Future<Map<String, String>> fetchSettings() async {
    final token = await AuthService.getToken();
    final response = await http.get(
      Uri.parse('https://kfz.nowarmy.de/api/settings/get.php'),
      headers: {'Authorization': token ?? ''},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['success'] == true && data['settings'] != null) {
        return Map<String, String>.from(data['settings']);
      }
    }
    return {};
  }
}
