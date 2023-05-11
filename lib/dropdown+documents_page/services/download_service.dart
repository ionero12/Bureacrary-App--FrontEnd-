import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

class FileDownloader {
  String jwtToken =
      "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJJb25lbGEiLCJyb2xlcyI6IlJPTEVfVVNFUiIsImlhdCI6MTY4MzgyOTU0MSwiZXhwIjoxNjgzODMwOTgxfQ.LfQ9ILTVb37MtjxzVBmYtGa1pW77UP6jPdvEag4EAUw";

  Future<Uint8List> downloadFile(int id) async {
    final url = Uri.parse('http://localhost:6969/api/tasks/download/byId/$id');
    final headers = {'Authorization': 'Bearer $jwtToken'};

    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      throw Exception('Failed to download file. Status code: ${response.statusCode}');
    }
  }
}


