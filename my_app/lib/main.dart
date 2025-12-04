import 'package:flutter/material.dart';
import 'package:my_app/ui/widget/QuizAppController.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizAppController(),
    );
  }
}
