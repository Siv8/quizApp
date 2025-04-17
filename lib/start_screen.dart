import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(context) {
    return Center(
        child:Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('images/quiz-logo.png',
              width: 300,
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
            OutlinedButton(
                onPressed: (){} ,
              style:OutlinedButton.styleFrom(
              foregroundColor: Colors.white
              ),
                child: const Text('start quiz'),
            )


          ],
        )
    );
  }
}
