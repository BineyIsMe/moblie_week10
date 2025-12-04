import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  final VoidCallback onStart;

  const StartScreen({super.key, required this.onStart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: ElevatedButton(
                onPressed:
                    onStart,
                child: const Text('Start Quiz'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
