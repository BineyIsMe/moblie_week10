import 'package:flutter/material.dart';
import '../../data/question_data.dart';
import '../../models/quiz.dart';
import '../../models/question.dart';
import '../../models/answer.dart';

class QuizScreen extends StatefulWidget {
  final Quiz quiz;
  final VoidCallback onFinish;

  const QuizScreen({super.key, required this.quiz, required this.onFinish});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late List<Question> questions;
  late Quiz quiz;
  int index = 0;

  @override
  void initState() {
    super.initState();
    questions = QuestionRepository().getQuestions();
    quiz = widget.quiz;
    quiz.quesitons = questions[index];
  }

  void selectAnswer(String choice) {
    final currentQuestion = questions[index];
    quiz.addAnswer(Answer(question: currentQuestion, answerChoice: choice));
    if (index + 1 < questions.length) {
      setState(() {
        index++;
        quiz.quesitons = questions[index];
      });
    } else {
      widget.onFinish();
    }
  }

  @override
  Widget build(BuildContext context) {
    final q = questions[index];

    return Container(
      color: Colors.blue,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Text(
              q.title,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            Expanded(
              child: ListView.builder(
                itemCount: q.choices.length,
                itemBuilder: (context, i) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: ElevatedButton(
                      onPressed: () => selectAnswer(q.choices[i]),
                      child: Text(
                        q.choices[i],
                        style: const TextStyle(fontSize: 22),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
