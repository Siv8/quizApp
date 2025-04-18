import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz,{super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
        child:Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('images/quiz-logo.png',
              width: 300,
              color:const Color.fromARGB(150, 255, 255, 255),
              ),
           const SizedBox(height: 88,),
            const Text(
              'learn Flutter with Max & NTV',
              style: TextStyle(
                color: Color.fromARGB(255, 237, 223, 252 ),
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 35,),
            OutlinedButton.icon(
                onPressed: startQuiz,
              style:OutlinedButton.styleFrom(
              foregroundColor: Colors.white
              ),
              icon:const Icon(Icons.arrow_right_alt),
                label: const Text('start quiz'),
            )


          ],
        )
    );
  }
}
