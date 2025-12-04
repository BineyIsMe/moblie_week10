import 'package:flutter/material.dart';
import 'package:my_app/ui/widget/answerCard.dart';
import '../../models/submission.dart';
import '../../models/quiz.dart';
// make a widget folder for reusable widgets

class HistoryScreen extends StatelessWidget {
  final Submission submission;

  const HistoryScreen({super.key, required this.submission});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: ListView.builder(
        itemCount: submission.quizs.length,
        itemBuilder: (context, quizIndex) {
          final Quiz quiz = submission.quizs[quizIndex];
          final score = quiz.getScore();
          return Container(
            color: Colors.white,
            child: ExpansionTile(
              title: Text(
                'Quiz ${quizIndex + 1} - Score: $score/${quiz.answers.length}',
              ),
              children: quiz.answers
                  .map((answer) => AnswerCard(answer: answer))
                  .toList(),
            ),
          );
        },
      ),
    );
  }
}
