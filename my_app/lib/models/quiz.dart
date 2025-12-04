import 'package:my_app/models/answer.dart';
import 'package:my_app/models/question.dart';


class Quiz {
  final List<Answer> answers = [];
  Question quesitons;

  Quiz({required this.quesitons});

  void addAnswer(Answer answer) {
    answers.add(answer);
  }

  int getScore() {
    int score = 0;
    for (var answer in answers) {
      if (answer.answerChoice == answer.question.goodChoice) {
        score++;
      }
    }
    return score;
  }
}
