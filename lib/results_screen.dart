import 'package:flutter/material.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/question_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key,required this.chosenAnswers, required this.onRestart,});

  final List<String> chosenAnswers;
  final void Function() onRestart;

  List<Map<String,Object>> getSummaryData(){
    final List<Map<String,Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++ ) {
      final correctAnswer = questions[i].answers[0];
      final userAnswer = chosenAnswers[i];

      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': correctAnswer,
        'user_answer': userAnswer,
        'is_correct': userAnswer == correctAnswer
      }
      );
    }

    return summary;

  }

  @override
  Widget build(BuildContext context) {
    final summarData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions =summarData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    } ).length;

    return SizedBox(
        width: double.infinity,
        child: Container(
        margin: const EdgeInsets.all(42) ,
    child:Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Text('you answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
           style:GoogleFonts.tangerine(
               color: Colors.tealAccent,
           fontSize: 48),
             ),
        const SizedBox(height: 30,),
        QuestionsSummary(getSummaryData()),
        const SizedBox(height: 30,),
        TextButton(
            onPressed:onRestart,
            child:Row(
              mainAxisSize: MainAxisSize.min,
              children: const[Icon(Icons.restart_alt),
              SizedBox(width: 8,
              ),
                Text('Restart Quiz')
              ],
            )
          
        )
    ],
    ),
        ),
    );
  }
}