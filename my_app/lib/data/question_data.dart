import 'package:my_app/models/question.dart';

class QuestionRepository {
   List<Question> getQuestions() {
    return [
      Question(
        title: "What is the capital city of Cambodia?",
        choices: ["Phnom Penh", "Siem Reap", "Battambang", "Kampot"],
        goodChoice: "Phnom Penh",
      ),

      Question(
        title: "Which programming language is used in Flutter?",
        choices: ["Java", "Kotlin", "Dart", "Swift"],
        goodChoice: "Dart",
      ),  

      Question(
        title: "What is 5 + 7?",
        choices: ["10", "11", "12", "13"],
        goodChoice: "12",
      ),
    ];
  }
}
