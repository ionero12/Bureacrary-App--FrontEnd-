import 'dart:convert';
import 'package:http/http.dart' as http;
import 'institution.dart';

class InstitutionService {
  final String baseUrl = 'http://localhost:8086/api';

  Future<Institution> getInstitutionByName(String name) async {
    final response = await http.get(Uri.parse('$baseUrl/institutions/$name'));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      print(json);
      final institution = Institution.fromJson(json);
      print(institution.phoneNumber);
      return institution;
    } else {
      throw Exception('Failed to load institution');
    }
  }
}
