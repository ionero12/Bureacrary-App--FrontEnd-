import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/institution.dart';

class InstitutionService {
  final String baseUrl = 'http://localhost:6969/api/institutions';

  String jwtToken =
      "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJJb25lbGEiLCJyb2xlcyI6IlJPTEVfVVNFUiIsImlhdCI6MTY4MzgyOTU0MSwiZXhwIjoxNjgzODMwOTgxfQ.LfQ9ILTVb37MtjxzVBmYtGa1pW77UP6jPdvEag4EAUw";

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
