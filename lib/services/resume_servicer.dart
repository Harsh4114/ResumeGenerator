import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/resume_model.dart';

class ResumeService {
  Future<ResumeModel> fetchResume(String name) async {
    final url = Uri.parse(
      'https://expressjs-api-resume-random.onrender.com/resume?name=harsh',
    );
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return ResumeModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load resume');
    }
  }
}
