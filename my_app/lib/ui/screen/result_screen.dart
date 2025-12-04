import 'package:flutter/material.dart';
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

    return Container(
      color: Colors.blue,
      child: Padding(
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
                  return Card(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Q${index + 1}: ${answer.question.title}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          ...answer.question.choices.map((choice) {
                            final isSelected = choice == answer.answerChoice;
                            final isCorrect =
                                choice == answer.question.goodChoice;
                            Color? bgColor;
      
                            if (isSelected && isCorrect)
                              bgColor = Colors.green[300];
                            else if (isSelected && !isCorrect)
                              bgColor = Colors.red[300];
                            else
                              bgColor = null;
      
                            return Container(
                              margin: const EdgeInsets.only(bottom: 8),
                              decoration: BoxDecoration(
                                color: bgColor,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: isSelected
                                      ? (isCorrect ? Colors.green : Colors.red)
                                      : Colors.grey[300]!,
                                  width: 2,
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 16,
                              ),
                              child: Text(
                                choice,
                                style: const TextStyle(fontSize: 18),
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
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
