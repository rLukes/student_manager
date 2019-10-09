import 'package:flutter/material.dart';

void main(){
  runApp(StudentManager());
}

class StudentManager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("hello student..."),
      ),
    );
  }
}
