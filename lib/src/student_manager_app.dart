import 'package:flutter/material.dart';
import 'package:student_manager/src/screens/login_screen.dart';


class StudentManagerApp extends StatefulWidget {
  @override
  _StudentManagerAppState createState() => _StudentManagerAppState();
}

class _StudentManagerAppState extends State<StudentManagerApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Student Mananger",
      home: Scaffold(
        body: LoginScreen(),
      ),
    );
  }
}
