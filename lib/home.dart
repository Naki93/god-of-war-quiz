import 'package:flutter/material.dart';
import 'package:quiz_app/quiz.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  void startQuiz() {}

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 128, 20, 12),
            Color.fromARGB(255, 151, 37, 17),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Image.asset('assets/images/war.png', width: 300),
            const SizedBox(height: 70),
            const Text('God of War 2 Gameplay Quiz',
                style: TextStyle(
                    fontSize: 21,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 30),
            OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Quiz()),
                  );
                },
                style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
                child: const Text('Start Quiz'))
          ]),
        ));
  }
}
