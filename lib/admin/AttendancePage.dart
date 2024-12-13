import 'package:flutter/material.dart';

void main() {
  runApp(AttendancePage());
}

class AttendancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Attendance Overview')),
      body: ListView(
        children: List.generate(
          10,
          (index) => ListTile(
            title: Text('Student $index'),
            subtitle: Text('Status: Present'),
          ),
        ),
      ),
    );
  }
}
