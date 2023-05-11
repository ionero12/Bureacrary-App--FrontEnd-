import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/document.dart';

class DocumentApi {
  final String baseUrl = 'http://localhost:6969/api/tasks';

  String jwtToken =
      "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJJb25lbGEiLCJyb2xlcyI6IlJPTEVfVVNFUiIsImlhdCI6MTY4MzgyOTU0MSwiZXhwIjoxNjgzODMwOTgxfQ.LfQ9ILTVb37MtjxzVBmYtGa1pW77UP6jPdvEag4EAUw";

  Future<List<Document>> getDocuments(String? name) async {
    final response = await http.get(Uri.parse('$baseUrl/find-by-name/$name'),
        headers: {'Authorization': 'Bearer $jwtToken'});
    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<Document> documents =
      body.map((dynamic item) => Document.fromJson(item)).toList();
      return documents;
    } else {
      throw "Failed to load documents list";
    }
  }
}