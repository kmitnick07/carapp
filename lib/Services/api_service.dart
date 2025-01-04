import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Model/WorkOrder/work_order_model.dart';

class ApiService {
  final String baseUrl;

  ApiService({required this.baseUrl});

  Future<List<WorkOrder>> fetchWorkOrders({required int page, required int limit}) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/workorders?page=$page&limit=$limit'));
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body)['data'];
        return jsonData.map((json) => WorkOrder.fromMap(json)).toList();
      } else {
        throw Exception('Failed to load work orders');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
