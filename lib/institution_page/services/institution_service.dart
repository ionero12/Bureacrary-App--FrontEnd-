import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../dropdown+documents_page/models/tokenProvider.dart';
import '../models/institution.dart';

class InstitutionService {
  final String baseUrl = 'http://localhost:6969/api/institutions';

  String jwtToken = TokenProvider().token;


  Future<Institution> getInstitutionByName(String name) async {
    final response = await http.get(Uri.parse('$baseUrl/$name'),
        headers: {'Authorization': 'Bearer $jwtToken'});
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final institution = Institution.fromJson(json);
      return institution;
    } else {
      throw Exception('Failed to load institution');
    }
  }
}
