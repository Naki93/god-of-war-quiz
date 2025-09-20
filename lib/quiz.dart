import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  // Tracks which question we are on
  int questionIndex = 0;

  // Tracks the score
  int score = 0;

  // Questions, answers, and correct answer index
  List<String> questions = [
    'In the Steeds of Time puzzle, what must you do to unlock the door?',
    'How do you defeat Perseus when he turns invisible?',
    'Which Titan helps Kratos?',
    'What should you do with Prometheus to get the Rage of the Titans power?'
  ];

  List<List<String>> answers = [
    [
      'Pull both chains at the same time',
      'Break the door with Barbarian Hammer',
      'Defeat all enemies first'
    ],
    [
      'Use the reflection from the water to spot him',
      'Use the Amulet of the Fates to freeze him',
      'Spam Cronos’ Rage until he reappears'
    ],
    ['Gaia', 'Atlas', 'Zeus'],
    [
      'Push him into the fire to end his suffering',
      'Set him free by breaking his chains',
      'Use Blade of Olympus on him'
    ]
  ];

  List<int> correctAnswers = [0, 0, 0]; // index of correct answer

  // Called when an answer button is pressed
  void answerQuestion(int selectedIndex) {
    if (selectedIndex == correctAnswers[questionIndex]) {
      score++;
    }

    // Update state to show next question
    setState(() {
      questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // If no more questions, show score
    if (questionIndex >= questions.length) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Your score is $score/${questions.length}',
                style: const TextStyle(fontSize: 22),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Go back to home page
                },
                child: const Text('Back to Start'),
              ),
            ],
          ),
        ),
      );
    }

    // Otherwise, show current question
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              questions[questionIndex],
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => answerQuestion(0),
              child: Text(answers[questionIndex][0]),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => answerQuestion(1),
              child: Text(answers[questionIndex][1]),
            ),
          ],
        ),
      ),
    );
  }
}
