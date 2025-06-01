import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/student_provider.dart';
import 'screens/student_list_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => StudentProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student CRUD App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const StudentListScreen(),
    );
  }
}
