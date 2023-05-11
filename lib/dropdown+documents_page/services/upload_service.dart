import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';

class FileUploader {
  String jwtToken =
      "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJJb25lbGEiLCJyb2xlcyI6IlJPTEVfVVNFUiIsImlhdCI6MTY4MzgyOTU0MSwiZXhwIjoxNjgzODMwOTgxfQ.LfQ9ILTVb37MtjxzVBmYtGa1pW77UP6jPdvEag4EAUw";

  Future<String> uploadFile(int id) async {
    final url = Uri.parse('http://localhost:6969/api/tasks/upload/byId/$id');
    final request = http.MultipartRequest('POST', url);
    request.headers['Authorization'] = 'Bearer $jwtToken';

    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null && result.files.isNotEmpty) {
      PlatformFile file = result.files.first;
      request.files.add(http.MultipartFile.fromBytes('file', file.bytes!, filename: file.name));
    } else {
      throw Exception('No file selected.');
    }

    final response = await request.send();

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(await response.stream.bytesToString());
      final result = jsonResponse['result'] as String;
      return result;
    } else {
      final responseBody = await response.stream.bytesToString();
      return responseBody;
    }
  }
}
