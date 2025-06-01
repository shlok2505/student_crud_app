import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/student.dart';
import '../providers/student_provider.dart';

class StudentFormScreen extends StatefulWidget {
  final Student? student;
  const StudentFormScreen({super.key, this.student});

  @override
  State<StudentFormScreen> createState() => _StudentFormScreenState();
}

class _StudentFormScreenState extends State<StudentFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController name, email, dob, contact, dept, year, addr;

  @override
  void initState() {
    super.initState();
    name = TextEditingController(text: widget.student?.name ?? '');
    email = TextEditingController(text: widget.student?.email ?? '');
    dob = TextEditingController(text: widget.student?.dateOfBirth ?? '');
    contact = TextEditingController(text: widget.student?.contact ?? '');
    dept = TextEditingController(text: widget.student?.department ?? '');
    year = TextEditingController(text: widget.student?.year ?? '');
    addr = TextEditingController(text: widget.student?.address ?? '');
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<StudentProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: Text(widget.student == null ? 'Add Student' : 'Edit Student')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildTextField(name, 'Name'),
              _buildTextField(email, 'Email'),
              _buildTextField(dob, 'Date of Birth'),
              _buildTextField(contact, 'Contact'),
              _buildTextField(dept, 'Department'),
              _buildTextField(year, 'Year'),
              _buildTextField(addr, 'Address'),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Submit'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final student = Student(
                      id: widget.student?.id,
                      name: name.text,
                      email: email.text,
                      dateOfBirth: dob.text,
                      contact: contact.text,
                      department: dept.text,
                      year: year.text,
                      address: addr.text,
                    );
                    widget.student == null
                        ? provider.addStudent(student)
                        : provider.updateStudent(student);
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController ctrl, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextFormField(
        controller: ctrl,
        decoration: InputDecoration(labelText: label, border: const OutlineInputBorder()),
        validator: (value) => value == null || value.isEmpty ? 'Enter $label' : null,
      ),
    );
  }
}
