import 'dart:convert';
import 'package:http/http.dart' as http;

class TasksService {
  final String baseUrl = 'http://localhost:6969/api/tasks/names';

  String jwtToken =
      "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJJb25lbGEiLCJyb2xlcyI6IlJPTEVfVVNFUiIsImlhdCI6MTY4MzgyOTU0MSwiZXhwIjoxNjgzODMwOTgxfQ.LfQ9ILTVb37MtjxzVBmYtGa1pW77UP6jPdvEag4EAUw";

  Future<List<String>> getTasksNames() async {
    final response = await http.get(Uri.parse(baseUrl),
        headers: {'Authorization': 'Bearer $jwtToken'});
    if (response.statusCode == 200) {
      final List<dynamic> json = jsonDecode(response.body);
      return List<String>.from(json);
    } else {
      throw Exception('Failed to load institution');
    }
  }
}