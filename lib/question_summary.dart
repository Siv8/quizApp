import 'package:flutter/material.dart';
import 'package:quizapp/results_screen.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            final questionNumber = (data['question_index'] as int) + 1;
            final isCorrect = data['is_correct'] as bool;

            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Container(
                  width: 30,
                  height: 30,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isCorrect ? Colors.green : Colors.red,
                  ),
                  child: Text(
                    questionNumber.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Question and answer details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['question'] as String,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text('Your answer: ${data['user_answer']}',
                      style: TextStyle(
                        color: isCorrect ? Colors.green : Colors.red,
                      ),),
                      Text('Correct answer: ${data['correct_answer']}',
                      style: const TextStyle(
                        color: Colors.yellowAccent,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}