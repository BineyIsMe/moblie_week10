import 'package:flutter/material.dart';
import 'package:my_app/data/question_data.dart';
import 'package:my_app/models/quiz.dart';
import 'package:my_app/models/submission.dart';
import 'package:my_app/ui/screen/HistoryScreen.dart';
import 'package:my_app/ui/screen/quiz_screen.dart';
import 'package:my_app/ui/screen/result_screen.dart';
import 'package:my_app/ui/screen/start_screen.dart';

enum Screen { home, quiz, result, history }

class QuizAppController extends StatefulWidget {
  const QuizAppController({super.key});

  @override
  State<QuizAppController> createState() => _QuizAppControllerState();
}

class _QuizAppControllerState extends State<QuizAppController> {
  Screen current = Screen.home;
  late Quiz quiz;
  Submission submission = Submission(quizs: []);

  void startQuiz() {
    setState(() {
      current = Screen.quiz;
      final questions = QuestionRepository().getQuestions();
      quiz = Quiz(quesitons: questions[0]);
    });
  }

  void finishQuiz() {
    setState(() {
      current = Screen.result;
      submission.quizs.add(quiz);
    });
  }

  void viewHistory() {
    setState(() {
      current = Screen.history;
    });
  }

  void backHome() {
    setState(() {
      current = Screen.home;
    });
  }

  Widget renderScreen() {
    switch (current) {
      case Screen.home:
        return StartScreen(onStart: startQuiz);
      case Screen.quiz:
        return QuizScreen(quiz: quiz, onFinish: finishQuiz);
      case Screen.result:
        return ResultScreen(
          quiz: quiz,
          submission: submission,
          onViewHistory: viewHistory,
          onRestart: backHome,
        );
      case Screen.history:
        return HistoryScreen(submission: submission);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: renderScreen(),
      ),
    );
  }
}
