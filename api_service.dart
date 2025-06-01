import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/student.dart';

class ApiService {
  static const String baseUrl = 'http://10.0.2.2:3001/students';

  Future<List<Student>> fetchStudents() async {
    final res = await http.get(Uri.parse(baseUrl));
    if (res.statusCode == 200) {
      return (jsonDecode(res.body) as List)
          .map((json) => Student.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load students');
    }
  }

  Future<void> addStudent(Student student) async {
    await http.post(Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(student.toJson()));
  }

  Future<void> updateStudent(Student student) async {
    await http.put(Uri.parse('\$baseUrl/\${student.id}'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(student.toJson()));
  }

  Future<void> deleteStudent(int id) async {
    await http.delete(Uri.parse('\$baseUrl/\$id'));
  }
}
