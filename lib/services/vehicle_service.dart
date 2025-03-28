
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'auth_service.dart';

class VehicleService {
  static const String baseUrl = 'https://kfz.nowarmy.de/api/vehicles';

  static Future<List<Map<String, dynamic>>> fetchVehicles() async {
    final token = await AuthService.getToken();
    final response = await http.get(
      Uri.parse('$baseUrl/list.php'),
      headers: {'Authorization': token ?? ''},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['success'] == true) {
        return List<Map<String, dynamic>>.from(data['vehicles']);
      }
    }
    return [];
  }

  static Future<bool> deleteVehicle(int id) async {
    final token = await AuthService.getToken();
    final response = await http.delete(
      Uri.parse('$baseUrl/delete.php'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': token ?? ''
      },
      body: jsonEncode({'id': id}),
    );
    return response.statusCode == 200;
  }

  static Future<bool> approvePlates(List<int> ids) async {
    final token = await AuthService.getToken();
    final response = await http.post(
      Uri.parse('$baseUrl/approve.php'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': token ?? ''
      },
      body: jsonEncode({'plate_ids': ids}),
    );
    final data = jsonDecode(response.body);
    return data['success'] == true;
  }
}
