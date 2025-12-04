import 'package:flutter/material.dart';
import 'package:my_app/ui/widget/ResultAnswerCard.dart';
import '../../models/quiz.dart';
import '../../models/submission.dart';

class ResultScreen extends StatelessWidget {
  final Quiz quiz;
  final Submission submission;
  final VoidCallback onRestart;
  final VoidCallback onViewHistory;

  const ResultScreen({
    super.key,
    required this.quiz,
    required this.submission,
    required this.onRestart,
    required this.onViewHistory,
  });

  @override
  Widget build(BuildContext context) {
    final totalQuestions = quiz.answers.length;
    final score = quiz.getScore();
    return Scaffold(
      appBar: AppBar(title: const Text('Quiz Result')),
      body: Container(
        color: Colors.blue[100],
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              'Score: $score / $totalQuestions',
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                itemCount: quiz.answers.length,
                itemBuilder: (context, index) {
                  final answer = quiz.answers[index];
                  return ResultAnswerCard(
                    answer: answer,
                    showCorrectIcon: true, // pass this to display tick
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: onViewHistory,
                  child: const Text(
                    'View History',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: onRestart,
                  child: const Text(
                    'Restart Quiz',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
