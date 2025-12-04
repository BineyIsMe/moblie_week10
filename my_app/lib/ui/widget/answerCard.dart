import 'package:flutter/material.dart';
import '../../models/answer.dart';

class AnswerCard extends StatelessWidget {
final Answer answer;

const AnswerCard({super.key, required this.answer});

@override
Widget build(BuildContext context) {
return Card(
color: Colors.white,
margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
child: Padding(
padding: const EdgeInsets.all(12),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
answer.question.title,
style: const TextStyle(fontWeight: FontWeight.bold),
),
const SizedBox(height: 8),
...answer.question.choices.map((choice) {
final isSelected = choice == answer.answerChoice;
final isCorrect = choice == answer.question.goodChoice;
Color? bgColor;


          if (isSelected && isCorrect) bgColor = Colors.green[300];
          else if (isSelected && !isCorrect) bgColor = Colors.red[300];
          else bgColor = null;

          return Container(
            margin: const EdgeInsets.only(bottom: 4),
            padding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
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
            child: Text(choice),
          );
        }),
      ],
    ),
  ),
);


}
}
