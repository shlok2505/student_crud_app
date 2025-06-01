import 'package:flutter/material.dart';
import '../models/student.dart';
import '../services/api_service.dart';

class StudentProvider with ChangeNotifier {
  List<Student> _students = [];
  final ApiService _api = ApiService();

  List<Student> get students => _students;

  Future<void> loadStudents() async {
    _students = await _api.fetchStudents();
    notifyListeners();
  }

  Future<void> addStudent(Student student) async {
    await _api.addStudent(student);
    await loadStudents();
  }

  Future<void> updateStudent(Student student) async {
    await _api.updateStudent(student);
    await loadStudents();
  }

  Future<void> deleteStudent(int id) async {
    await _api.deleteStudent(id);
    await loadStudents();
  }
}
